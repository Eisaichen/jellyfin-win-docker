FROM mcr.microsoft.com/windows/server:ltsc2022

EXPOSE 8096

COPY ./res c:/res
COPY ./jellyfin c:/jellyfin/system

RUN powershell Move-Item -Force 'C:\res\nvdll\System32\*' 'C:\Windows\System32\' ; \
    Move-Item -Force 'C:\res\nvdll\SysWOW64\*' 'C:\Windows\SysWOW64\' ; \
    mkdir media ; \
    mkdir data ; \
    Remove-Item -r c:\res

WORKDIR C:/jellyfin/system
ENTRYPOINT jellyfin.exe -d c:\data --service

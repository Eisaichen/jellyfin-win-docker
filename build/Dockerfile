FROM mcr.microsoft.com/windows/server:ltsc2022

EXPOSE 8096

COPY ./res c:/res
COPY ./jellyfin c:/jellyfin/system

RUN powershell takeown /F c:\jellyfin /R /D Y ; \
    takeown /F c:\res\nvdll /R /D Y /A ; \
    Move-Item -Path c:\res\nvdll\* -Destination C:\Windows\System32 ; \
    Import-Certificate -FilePath c:\res\cacert.sst -CertStoreLocation 'Cert:\LocalMachine\Root' ; \
    mkdir media ; \
    mkdir data ; \
    Remove-Item -r c:\res

WORKDIR C:/jellyfin/system
ENTRYPOINT jellyfin.exe -d c:\data --service

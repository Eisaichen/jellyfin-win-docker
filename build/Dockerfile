FROM mcr.microsoft.com/windows/server:ltsc2022

EXPOSE 8096

COPY ./nvdll/System32/* C:/Windows/System32/
COPY ./nvdll/SysWOW64/* C:/Windows/SysWOW64/
COPY ./jellyfin c:/jellyfin/system

RUN mkdir media && \
    mkdir data

WORKDIR C:/jellyfin/system
ENTRYPOINT jellyfin.exe -d c:\data --service

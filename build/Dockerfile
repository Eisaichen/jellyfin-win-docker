FROM mcr.microsoft.com/windows/server:ltsc2022

EXPOSE 8096

COPY ./nvdll/* C:/Windows
COPY ./jellyfin c:/jellyfin/system

RUN mkdir media && \
    mkdir data

WORKDIR C:/jellyfin/system
ENTRYPOINT jellyfin.exe -d c:\data --service

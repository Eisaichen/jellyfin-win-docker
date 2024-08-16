.\wget --no-hsts "https://repo.jellyfin.org/files/server/windows/latest-stable/amd64/jellyfin_$($env:GH_CI_TAG.substring(1))-amd64.zip" -O .\jellyfin.zip
Expand-Archive -Path .\jellyfin.zip -DestinationPath .\build\

docker pull mcr.microsoft.com/windows/server:ltsc2022
docker build --isolation hyperv --no-cache -t eisai/jellyfin-nvidia:latest -t eisai/jellyfin-nvidia:$env:GH_CI_TAG .\build

if ($env:GH_CI_PUSH -eq "true") {
    docker push eisai/jellyfin-nvidia -a
}

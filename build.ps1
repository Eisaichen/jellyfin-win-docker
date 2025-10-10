# Download Jellyfin

.\wget --no-hsts -q "https://repo.jellyfin.org/files/server/windows/latest-stable/amd64/jellyfin_$($env:GH_CI_TAG.substring(1))-amd64.zip" -O .\jellyfin.zip
Expand-Archive -Path .\jellyfin.zip -DestinationPath .\build\


# Build ltsc2022

if ($env:GH_CI_LATEST -eq "true") {
    docker build --isolation hyperv --no-cache --pull -t eisai/jellyfin-nvidia:latest -t eisai/jellyfin-nvidia:$env:GH_CI_TAG .\build
} else {
    docker build --isolation hyperv --no-cache --pull -t eisai/jellyfin-nvidia:$env:GH_CI_TAG .\build
}
# Push
if ($env:GH_CI_PUSH -eq "true") {
    docker push eisai/jellyfin-nvidia -a
}
# Clean up
docker system prune --all -f


# Build ltsc2025

$i=Get-Content -Path .\build\Dockerfile
Set-Content -Path .\build\Dockerfile -Value $($i.replace("FROM mcr.microsoft.com/windows/server:ltsc2022","FROM mcr.microsoft.com/windows/server:ltsc2025"))

if ($env:GH_CI_LATEST -eq "true") {
    docker build --isolation hyperv --no-cache --pull -t eisai/jellyfin-nvidia:ltsc2025 -t eisai/jellyfin-nvidia:$env:GH_CI_TAG-ltsc2025 .\build
} else {
    docker build --isolation hyperv --no-cache --pull -t eisai/jellyfin-nvidia:$env:GH_CI_TAG-ltsc2025 .\build
}
# Push
if ($env:GH_CI_PUSH -eq "true") {
    docker push eisai/jellyfin-nvidia -a
}

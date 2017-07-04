# escape=`
FROM microsoft/windowsservercore

MAINTAINER marius.davidsen@fusetools.com

ADD build_container_deps.ps1 C:\
ADD build_container_repo.ps1 C:\
RUN powershell C:\build_container_deps.ps1
RUN powershell C:\build_container_repo.ps1

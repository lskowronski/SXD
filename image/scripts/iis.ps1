# See also:
#   - https://github.com/microsoft/iis-docker/blob/master/windowsservercore/Dockerfile
#   - https://github.com/microsoft/aspnet-docker/blob/master/4.6.2/Dockerfile

Add-WindowsFeature Web-Server
Add-WindowsFeature NET-Framework-45-ASPNET
Add-WindowsFeature Web-Asp-Net45

C:\Windows\System32\inetsrv\appcmd.exe delete site "default web site"

C:\Windows\System32\inetsrv\appcmd.exe add site /name:Sitecore /bindings:http/*:80: /physicalPath:C:\shared\Website

C:\Windows\System32\inetsrv\appcmd.exe start site Sitecore

iisreset
FROM microsoft/windowsservercore

LABEL Description="Sitecore Experience Platform 8.2 rev. 170407 (8.2 Update-3)." Vendor="Sitecore" Version="8.2 rev. 170407"

# Adding the files
ADD image/installers/ /
ADD image/sitecore/ /image/sitecore
ADD image/scripts/ /image/scripts
ADD licenses/ /licenses
WORKDIR /


# Installing MS SQL Server
RUN SQLEXPR_x64_ENU.exe /qs /x:setup && /setup/setup.exe /q /ACTION=Install /INSTANCENAME=SQLEXPRESS /FEATURES=SQLEngine /UPDATEENABLED=0 /SQLSVCACCOUNT="NT AUTHORITY\System" /SQLSYSADMINACCOUNTS="BUILTIN\ADMINISTRATORS" /TCPENABLED=1 /NPENABLED=0 /IACCEPTSQLSERVERLICENSETERMS && del /F /Q SQLEXPR_x64_ENU.exe && rd /q /s setup

# Setting up MS SQL Server and attaching databases
RUN powershell /image/scripts/sql.ps1 -Verbose

# Setting up IIS and adding the website
RUN powershell /image/scripts/iis.ps1 -Verbose

EXPOSE 80
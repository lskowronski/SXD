$clientName = "ClientName"
##################################################################################################
# prepare directory for installers
Write-Host "Preparing installers directory"
$installersDirName = "installers";
$installersDir = "./image/$installersDirName";
if((Test-Path $installersDir) -eq 0)
{
    New-Item -ItemType Directory -Force -Path $installersDirName
}
# download sql server installation file
$SQLSERVERInstallationFile = "SQLEXPR_x64_ENU.exe";
if((Test-Path "$installersDir/$SQLSERVERInstallationFile") -eq 0)
{
    Write-Host "Downloading of $SQLSERVERInstallationFile"
    wget https://go.microsoft.com/fwlink/?linkid=829176 -OutFile $installersDir/$SQLSERVERInstallationFile
}
Write-Host "$SQLSERVERInstallationFile is available"
Write-Host "Installers directory is ready"
##################################################################################################
Write-Host "Checking availability of vanilla Sitecore"
# check directory with vanilla Sitecore
$vanillaSitecoreDirName = "sitecore";
$vanillaSitecoreDir = "./image/$vanillaSitecoreDirName";
if((Test-Path $vanillaSitecoreDir) -eq 0)
{
    New-Item -ItemType Directory -Force -Path $vanillaSitecoreDirName
}
if((Test-Path "$vanillaSitecoreDir/Website") -eq 0)
{
    Write-Error -Message "Vanilla Sitecore is not available! Unpack your Sitecore into sitecore directory." -Category InvalidData
    return;
}
Write-Host "Vanilla Sitecore is available"
##################################################################################################
# check license files
Write-Host "Check existence of required licenses"
$licensesDirName = "licenses"
$licensesDir = "./$licensesDirName"
if((Test-Path $licensesDir) -eq 0)
{
    New-Item -ItemType Directory -Force -Path $licensesDirName
}
if((Test-Path "$licensesDir/license.xml") -eq 0)
{
    Write-Error -Message "Sitecore license is not available! Copy license.xml file into licenses directory." -Category InvalidData
    return;
}
Write-Host "All required license files are available"
##################################################################################################
# create directory for work
Write-Host "Create directory for poject"
if((Test-Path "./project") -eq 0)
{
    New-Item -ItemType Directory -Force -Path "project"
}
Write-Host "Create directory for solution"
if((Test-Path "./project/solution") -eq 0)
{
    New-Item -ItemType Directory -Force -Path "project/solution"
}
Write-Host "Create directory for inetpub"
if((Test-Path "./project/inetpub") -eq 0)
{
    New-Item -ItemType Directory -Force -Path "project/inetpub"
}
if((Test-Path "./project/inetpub/Website") -eq 0)
{
    Write-Host "Copying vanilla Sitecore into inetpub"
    Copy-Item -Force -Recurse -Path image/sitecore/* -Destination project/inetpub
    Write-Host "Files are in inetpub"    
}
# we do not have to check existence, if exists will not be created again
# docker volume create --name $clientName > $null
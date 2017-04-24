$clientsName = "sitecore"

docker rm $clientsName
docker run -d=true --name $clientsName --publish 80:80 --tty=false --interactive=true $clientsName powershell

#docker container create $clientsName --publish 80:80 --tty=false --isolation="default"
#docker start $clientsName

$containerIP = docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $clientsName

Write-Host "Container IP is $containerIP"



# Setting up MS SQL Server and attaching databases
#docker exec $clientsName powershell /scripts/sql.ps1 -Verbose

# Setting up IIS and adding the website
#docker exec $clientsName powershell /scripts/iis.ps1 -Verbose

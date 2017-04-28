
Set-StrictMode -Version latest ;

Invoke-Sqlcmd -Query "CREATE DATABASE Sitecore_Analytics ON (FILENAME = 'C:\shared\Databases\Sitecore.Analytics.mdf'), (FILENAME = 'C:\shared\Databases\Sitecore.Analytics.ldf') FOR ATTACH ;" -ServerInstance "." ;
Invoke-Sqlcmd -Query "CREATE DATABASE Sitecore_Core      ON (FILENAME = 'C:\shared\Databases\Sitecore.Core.mdf'),      (FILENAME = 'C:\shared\Databases\Sitecore.Core.ldf')      FOR ATTACH ;" -ServerInstance "." ;
Invoke-Sqlcmd -Query "CREATE DATABASE Sitecore_Master    ON (FILENAME = 'C:\shared\Databases\Sitecore.Master.mdf'),    (FILENAME = 'C:\shared\Databases\Sitecore.Master.ldf')    FOR ATTACH ;" -ServerInstance "." ;
Invoke-Sqlcmd -Query "CREATE DATABASE Sitecore_Web       ON (FILENAME = 'C:\shared\Databases\Sitecore.Web.mdf'),       (FILENAME = 'C:\shared\Databases\Sitecore.Web.ldf')      FOR ATTACH ;" -ServerInstance "." ;
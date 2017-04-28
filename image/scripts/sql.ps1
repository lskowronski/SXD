# See also:
#   - https://github.com/Microsoft/sql-server-samples/tree/master/samples/manage/windows-containers/mssql-server-2016-express-windows

Set-StrictMode -Version latest ;

Stop-Service MSSQL`$SQLEXPRESS ;

Set-ItemProperty -Path 'HKLM:\software\microsoft\microsoft sql server\mssql13.SQLEXPRESS\mssqlserver\supersocketnetlib\tcp\ipall' -Name tcpdynamicports -Value '' ;
Set-ItemProperty -Path 'HKLM:\software\microsoft\microsoft sql server\mssql13.SQLEXPRESS\mssqlserver\supersocketnetlib\tcp\ipall' -Name tcpport -Value 1433 ;
Set-ItemProperty -Path 'HKLM:\software\microsoft\microsoft sql server\mssql13.SQLEXPRESS\mssqlserver' -Name LoginMode -Value 2 ;

Start-Service MSSQL`$SQLEXPRESS ;

Invoke-Sqlcmd -Query "ALTER LOGIN sa with password='Str0ng_En0ugh'; ALTER LOGIN sa ENABLE;" -ServerInstance "." ;
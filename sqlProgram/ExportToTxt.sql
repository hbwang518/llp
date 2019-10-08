--exec sp_configure
--EXEC sp_configure 'show advanced options', 1 
--go
--RECONFIGURE 
--go
--EXEC sp_configure 'xp_cmdshell', 0 
--go
--RECONFIGURE 
--go

EXEC xp_cmdshell 'BCP "SELECT TOP 20 * FROM speciesRichnessXinJiang.dbo.allType" queryout e:\currency2.txt -c -t , -T '
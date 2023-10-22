echo Installing ntrights.exe to C:\Windows\System32
copy %currentPath%\Resources\ntrights.exe C:\Windows\System32
if exist C:\Windows\System32\ntrights.exe (
	echo Installation succeeded, managing user rights..
	set remove=("Backup Operators" "Everyone" "Power Users" "Users" "NETWORK SERVICE" "LOCAL SERVICE" "Remote Desktop User" "ANONOYMOUS LOGON" "Guest" "Performance Log Users")
	for %%a in (%remove%) do (
			ntrights -U %%a -R SeNetworkLogonRight 
			ntrights -U %%a -R SeIncreaseQuotaPrivilege
			ntrights -U %%a -R SeInteractiveLogonRight
			ntrights -U %%a -R SeRemoteInteractiveLogonRight
			ntrights -U %%a -R SeSystemtimePrivilege
			ntrights -U %%a +R SeDenyNetworkLogonRight
			ntrights -U %%a +R SeDenyRemoteInteractiveLogonRight
			ntrights -U %%a -R SeProfileSingleProcessPrivilege
			ntrights -U %%a -R SeBatchLogonRight
			ntrights -U %%a -R SeUndockPrivilege
			ntrights -U %%a -R SeRestorePrivilege
			ntrights -U %%a -R SeShutdownPrivilege
		)
		ntrights -U "Administrators" -R SeImpersonatePrivilege
		ntrights -U "Administrator" -R SeImpersonatePrivilege
		ntrights -U "SERVICE" -R SeImpersonatePrivilege
		ntrights -U "LOCAL SERVICE" +R SeImpersonatePrivilege
		ntrights -U "NETWORK SERVICE" +R SeImpersonatePrivilege
		ntrights -U "Administrators" +R SeMachineAccountPrivilege
		ntrights -U "Administrator" +R SeMachineAccountPrivilege
		ntrights -U "Administrators" -R SeIncreaseQuotaPrivilege
		ntrights -U "Administrator" -R SeIncreaseQuotaPrivilege
		ntrights -U "Administrators" -R SeDebugPrivilege
		ntrights -U "Administrator" -R SeDebugPrivilege
		ntrights -U "Administrators" +R SeLockMemoryPrivilege
		ntrights -U "Administrator" +R SeLockMemoryPrivilege
		ntrights -U "Administrators" -R SeBatchLogonRight
		ntrights -U "Administrator" -R SeBatchLogonRight
		echo Managed User Rights
)
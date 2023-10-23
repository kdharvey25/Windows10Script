echo Disabling Administrator account...
net user Administrator /active:no && (
	echo Disabled administrator account
	(call)
) || echo Administrator account not disabled
echo Disabling Guest account...
net user Guest /active:no && (
	echo Disabled Guest account
	(call)
) || echo Guest account not disabled
echo Disabled guest account
echo Renaming Administrator to "Dude" and Guest to "LameDude"
start C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe "%currentPath%resources\RenameDefAccounts.ps1"
echo Renamed Administrator to "Dude" and Guest to "LameDude"
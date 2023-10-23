$path=Split-Path -Path $PWD -Parent
$path2=Get-content $path/output
$accounts = Get-Wmiobject Win32_UserAccount -filter 'LocalAccount=TRUE' | select-object -expandproperty Name
if (Test-Path $path2/currentUsers.txt) {
    Remove-Item $path2/currentUsers.txt -Force
}
New-Item -Path $path2/currentUsers.txt -ItemType File
$userList = Get-WmiObject -Class Win32_UserAccount | Where-Object { $_.Name -ne $currentUsername -and $_.Name -ne 'Administrator' }
$userList | Select-Object Name, FullName | Export-Csv -Path $path2/currentUsers.txt -NoTypeInformation
foreach($l in $accounts){
	$l >> "$path2/currentUsers.txt"
}
$path=Split-Path -Path $PWD -Parent
$path2=Get-content $path/output
$accounts = Get-Wmiobject Win32_UserAccount -filter 'LocalAccount=TRUE' | select-object -expandproperty Name
if (Test-Path $path2/currentUsers.txt) {
    Remove-Item $path2/currentUsers.txt -Force
}
New-Item -Path $path2/currentUsers.txt -ItemType File
foreach($l in $accounts){
	$l >> "$path2/currentUsers.txt"
}
#Self elevate
if(-NOT([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")){   
	$arguments="& '"+$myinvocation.mycommand.definition+"'"
	Start-Process powershell -Verb runAs -ArgumentList $arguments
	Break
}

#$path=Split-Path -Path $PWD -Parent
#$path2=Get-item $path/Windows10Script/output

$path=Get-item .
Write-Host $path
$path2=Join-Path -Path $path -ChildPath "/output"
Write-Host $path2
if (Test-Path $path2/currentUsers.txt) {
    Remove-Item $path2/currentUsers.txt -Force
}
$currentUsername=$env:UserName
New-Item -Path $path2/currentUsers.txt -ItemType File
$userList = Get-WmiObject Win32_UserAccount | Where-Object { $_.Name -ne $currentUsername -and $_.Name -ne 'Administrator' }| select-object -expandproperty Name
foreach($l in $userList){
	$l>> "$path2/currentUsers.txt"
}
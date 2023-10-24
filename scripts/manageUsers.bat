
echo Managing users....

REM Output the current users excluding the current user and administrator accounts
start C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe "%currentPath%resources\usrList.ps1" /wait
echo Current Users have been output to %currentPath%\output\currentUsers.txt 


REM Disabling everyone - we will reenable them as they are checked
for /F "tokens=* delims=" %%z IN (%currentPath%\output\currentUsers.txt) DO (
	net user %%z 1qaz2wsx3edc4rfvA!
	net user %%z /active:no
	net user %%z /PasswordChg:no
	net user %%z /logonpasswordchg:no
	net user %%z /passwordreq:yes
	WMIC USERACCOUNT WHERE Name='%%f' SET PasswordExpires=FALSE
)

REM Adds back the admins
FOR /F "tokens=* delims=" %%e IN (%currentPath%\users\admins.txt) DO (
	net user %%e cybersecurity /add
    net localgroup Administrators %%e /add
	WMIC USERACCOUNT WHERE Name='%%e' SET PasswordExpires=TRUE
	net user %%e /active:yes
	net user %%e /PasswordChg:yes
)

REM Adds back all normal users
FOR /F "tokens=* delims=" %%f IN (%currentPath%\users\users.txt) DO (
    net user %%f 1NoPointDed! /add
    net localgroup Administrators %%f /del
	WMIC USERACCOUNT WHERE Name='%%f' SET PasswordExpires=TRUE
	net user %%f /active:yes
	net user %%f /PasswordChg:yes
	net user %%f /logonpasswordchg:yes
)

echo Users managed
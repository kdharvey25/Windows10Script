
echo Managing users....

REM Output the current users excluding the current user and administrator accounts
<<<<<<< HEAD
<<<<<<< HEAD
start C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe "%currentPath%\resources\usrList.ps1"
=======
Powershell.exe -executionpolicy remotesigned -File  %currentPath%\resources\ps.ps1
REM start C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe "%currentPath%resources\usrList.ps1"
>>>>>>> 5455435 (adf)
=======
start C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe "%currentPath%\resources\usrList.ps1"
>>>>>>> 803a303 (asdf)
echo Current Users have been output to %currentPath%\output\currentUsers.txt 

pause 
REM Disabling everyone - we will reenable them as they are checked

echo %currentPath%
start %currentPath%\output\currentUsers.txt
pause

echo before loop

FOR /F "tokens=* delims=" %%z IN (%currentPath%\output\currentUsers.txt) DO (
	echo %%z
	net user %%z 1qaz2wsx3edc4rfvA!
	net user %%z /active:no
	net user %%z /PasswordChg:no
	net user %%z /logonpasswordchg:no
	net user %%z /passwordreq:yes
	WMIC USERACCOUNT WHERE Name='%%z' SET PasswordExpires=FALSE
)

echo after loop

pause

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
REM Disabling everyone - we will reenable them as they are checked


REM Adds back the admins
FOR /F "tokens=* delims=" %%e IN (%currentPath%\admins.txt) DO (
	net user %%e cybersecurity /add
    net localgroup Administrators %%e /add
	WMIC USERACCOUNT WHERE Name='%%e' SET PasswordExpires=TRUE
	net user %%e /active:yes
	net user %%e /PasswordChg:yes
)

REM Adds back all normal users
FOR /F "tokens=* delims=" %%f IN (%currentPath%\users.txt) DO (
    net user %%f 1NoPointDed! /add
    net localgroup Administrators %%f /del
	WMIC USERACCOUNT WHERE Name='%%f' SET PasswordExpires=TRUE
	net user %%f /active:yes
	net user %%f /PasswordChg:yes
	net user %%f /logonpasswordchg:yes
)
REM Disabling everyone - we will reenable them as they are checked
for /f "skip=1" %%z in ('wmic UserAccount get Name') do (
	net user %%z 1qaz2wsx3edc4rfvA!
	net user %%z /active:no
	net user %%z /PasswordChg:no
	net user %%z /logonpasswordchg:no
	net user %%z /passwordreq:yes
	WMIC USERACCOUNT WHERE Name='%%f' SET PasswordExpires=FALSE
)

REM Adds back the admins
for %%e in %admin% do (
	net user %%e 1NoPointDed! /add
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

REM Adds back all normal users
FOR /F "tokens=* delims=" %%f IN (%currentPath%\users.txt) DO (
    net localgroup Administrators %%f /del
	net user %%f 1qaz2wsx3edc4rfvA!
	WMIC USERACCOUNT WHERE Name='%%f' SET PasswordExpires=TRUE
	net user %%f /active:yes
	net user %%f /PasswordChg:yes
	net user %%f /logonpasswordchg:yes
)
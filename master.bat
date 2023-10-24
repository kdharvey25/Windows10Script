@echo off

set currentPath=%cd%
echo Current path: %currentPath%
echo %cd%\output> %currentPath%\output\path.txt 


:main 
set /p mode="Auto or Manual? (a/m)"
if %mode%==a goto auto 
if %mode%==m goto manual

:auto
echo Setting script configurations...
call %currentPath%\config.bat
echo Configurations set

call %currentPath%\scripts\firewall.bat
call %currentPath%\scripts\checkfiles.bat
call %currentPath%\scripts\lsp.bat
pause
call %currentPath%\scripts\audit.bat
call %currentPath%\scripts\services.bat
call %currentPath%\scripts\reg.bat
call %currentPath%\scripts\powerSettings.bat
call %currentPath%\scripts\manageUsers.bat
call %currentPath%\scripts\shares.bat
call %currentPath%\scripts\flushDNS.bat
call %currentPath%\scripts\defAccounts.bat
call %currentPath%\scripts\winFeatures.bat
call %currentPath%\scripts\usrRights.bat

pause

:manual

pause




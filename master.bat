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

if (firewall) (call %currentPath%\scripts\firewall.bat)
if (checkfiles) (call %currentPath%\scripts\checkfiles.bat)
if (localSecurityPolicy) (call %currentPath%\scripts\lsp.bat)
if (auditPol) (call %currentPath%\scripts\audit.bat)
if (services) (call %currentPath%\scripts\services.bat)
if (registryKeys) (call %currentPath%\scripts\reg.bat)
if (powerSettings) (call %currentPath%\scripts\powerSettings.bat)
if (manageUsers) (call %currentPath%\scripts\manageUsers.bat)
if (shares) (call %currentPath%\scripts\shares.bat)
if (flushDNS) (call %currentPath%\scripts\flushDNS.bat)
if (defAccounts) (call %currentPath%\scripts\defAccounts.bat)
if (winFeatrues) (call %currentPath%\scripts\winFeatrues.bat)
if (userRights) (call %currentPath%\scripts\usrRights.bat)

pause

:manual

pause




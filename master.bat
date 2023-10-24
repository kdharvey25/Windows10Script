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

if %firewall% (call %currentPath%\scripts\firewall.bat)
if %checkfiles% (call %currentPath%\scripts\checkfiles.bat)
if %localSecurityPolicy% (call %currentPath%\scripts\lsp.bat)
if %auditPolicy% (call %currentPath%\scripts\audit.bat)
if %services% (call %currentPath%\scripts\services.bat)
if %registryKeys% (call %currentPath%\scripts\reg.bat)
if %powerSettings% (call %currentPath%\scripts\powerSettings.bat)
if %manageUsers% (call %currentPath%\scripts\manageUsers.bat)
if %shares% (call %currentPath%\scripts\shares.bat)
if %flushDNS% (call %currentPath%\scripts\flushDNS.bat)
if %defAccounts% (call %currentPath%\scripts\defAccounts.bat)
if %winFeatrues% (call %currentPath%\scripts\winFeatrues.bat)
if %userRights% (call %currentPath%\scripts\usrRights.bat)

pause

:manual
echo Choose an option:
echo 1. Set audit policy
echo 2. Check for media files
echo 3. defAccounts
echo 4. Set firewall settings
echo 5. FlushDNS
echo 6. Set Local Security Policy
echo 7. Manage Users
echo 8. Set power settings
echo 9. Set Registry Keys
echo 10. Output shares
echo 11. Manage services
echo 12. Set User Rights Assignments
echo 13. Set Windows Features
echo 14. exit

set /p "choice=Enter your choice: "

if "%choice%"=="1" goto One
if "%choice%"=="2" goto Two
if "%choice%"=="3" goto Three
if "%choice%"=="4" goto Four
if "%choice%"=="5" goto Five
if "%choice%"=="6" goto Six
if "%choice%"=="7" goto Seven
if "%choice%"=="8" goto Eight
if "%choice%"=="9" goto Nine
if "%choice%"=="10" goto Ten
if "%choice%"=="11" goto Eleven
if "%choice%"=="12" goto Twelve
if "%choice%"=="13" goto Thirteen
if "%choice%"=="14" goto Fourteen

:One
call %currentPath%\scripts\audit.bat
goto manual

:Two
call %currentPath%\scripts\checkfiles.bat
goto manual

:Three
call %currentPath%\scripts\defAccounts.bat
goto manual

:Four
call %currentPath%\scripts\firewall.bat
goto manual

:Five
call %currentPath%\scripts\flushDNS.bat
goto manual

:Six
call %currentPath%\scripts\lsp.bat
goto manual

:Seven
call %currentPath%\scripts\manageUsers.bat
goto manual

:Eight
call %currentPath%\scripts\powerSettings.bat
goto manual

:Nine
call %currentPath%\scripts\reg.bat
goto manual

:Ten
call %currentPath%\scripts\shares.bat
goto manual

:Eleven
call %currentPath%\scripts\services.bat
goto manual

:Twelve
call %currentPath%\scripts\usrRights.bat
goto manual

:Thirteen
call %currentPath%\scripts\winFeatrues.bat
goto manual

:Fourteen
exit

pause




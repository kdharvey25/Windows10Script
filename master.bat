@echo off


set currentPath=%cd%
echo Current path: %currentPath%

:main 
set /p mode="Auto or Manual? (a/m)"
if %mode%==a goto auto 
if %mode%==m goto manual

:auto
echo Setting script configurations...
:: Learn how to make config file
echo Configurations set

call %currentPath%\scripts\firewall.bat
call %currentPath%\scripts\lsp.bat
pause
call %currentPath%\scripts\audit.bat
call %currentPath%\scripts\usrRights.bat



pause

:manual

pause




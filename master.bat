@echo off


set currentPath=%cd%
echo current path %currentPath%

:main 
set /p mode="Auto or Manual? (a/m)"
if %mode%==a goto auto 
if %mode%==m goto manual

:auto
echo Setting script configurations...
:: Learn how to make config file
echo Configurations set

start %currentPath%\scripts\firewall.bat
start %currentPath%\scripts\lsp.bat

pause

:manual

pause




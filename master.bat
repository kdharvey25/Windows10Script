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

echo Securing firewall and setting advanced firewall settings
call %currentPath%\scripts\firewall.bat
echo advanced firewall setting set

echo Setting Local Security Policy 
call %currentPath%\scripts\lsp.bat
echo Set password policy: Password policy must meet complexity to enable
echo Set password policy: Store passwords using reversible encryption to disabled
pause 

echo Setting Audit Policy
call %currentPath%\scripts\audit.bat
echo Set Audit to success and failure



pause

:manual

pause




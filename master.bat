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



pause

:manual
pause




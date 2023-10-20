echo off 
echo Checking for administrator rights
net sessions
if %errorlevel%==0(
    echo Administrator rights confirmed
) else(
    echo Administrator rights not confirmed
    echo Please run as administrator
    pause
    exit
)

set /p mode="Auto or Manual? (a/m)"
if %mode%=a goto auto 
if %mode%=m goto manual

:auto
echo setting configurations...



:manual



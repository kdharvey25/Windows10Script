echo Setting password policy...
::Set account lockout to 5, min length to 8, max age to 30, min age to 1, and history to 5
net accounts /lockoutthreshold:5 /MINPWLEN:8 /MAXPWAGE:30 /MINPWAGE:1 /UNIQUEPW:5 
echo Set password policy: Password policy must meet complexity to enable
echo Set password policy: Store passwords using reversible encryption to disabled
echo Secpol.msc will be started for manual process
start secpol.msc /wait

pause
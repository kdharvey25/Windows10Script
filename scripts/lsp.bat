echo Setting password policy 

net accounts /lockoutthreshold:5 /MINPWLEN:30 /MAXPWLEN:30 /MINPWAGE /UNIQUEPW:5
echo Set password policy: Password must meet complexity enable
echo Set password policy: Store passwords using reversable encryption to disable

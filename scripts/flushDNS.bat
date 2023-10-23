echo Flushing DNS
ipconfig /flushdns >nul
echo Flushed DNS
echo Clearing contents of: C:\Windows\System32\drivers\etc\hosts
attrib -r -s C:\WINDOWS\system32\drivers\etc\hosts
echo > C:\Windows\System32\drivers\etc\hosts
attrib +r +s C:\WINDOWS\system32\drivers\etc\hosts
echo Cleared hosts file
set /p mode="Auto or Manual? (a/m)"


Powershell.exe -executionpolicy remotesigned -File  %currentPath%\resources\Check_Files.ps1

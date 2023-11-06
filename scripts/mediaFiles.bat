Rem Disallowed Media Files
choice /c ync /m "Do you wish to remove disallowed media files? (Manual and automatic mode are available) "
if %ERRORLEVEL% equ 3 (
    echo Canceling...
    pause
    goto:eof
)
if %ERRORLEVEL% equ 2 echo Skipping disallowed media files...
if %ERRORLEVEL% equ 1 (
    choice /c amc /m "Manual or automatic mode? (Manual mode steps through each file type and file while automatic mode disables them all) (MANUAL MODE IS HIGHLY RECOMMENDED AS YOU WILL NOT ACCIDENTALLY DELETE IMAGES/MEDIA USED BY APPLICATIONS) "
    set /a mode=!ERRORLEVEL!
    if !mode! equ 3 (
        echo Skipping disallowed media files... 
    ) else (
        set filetypes=mp3 mov mp4 avi mpg mpeg flac m4a flv ogg gif png jpg jpeg
        cd C:\Users
        echo ------------------------------------------------------------------------------------
        echo *** Deleting disallowed media file types...                                      ***
        Rem Automatic mode
        if !mode! equ 1 (
            :: %%i = file extension
            for %%i in (!filetypes!) do (
                echo Deleting all .%%i files...
                :: %%a = individual file
                for /f "delims=" %%a in ('dir /s /b *.%%i') do (
                    echo Deleting %%a...
                    del "%%a"
                )
            )
        Rem Manual mode
        ) else (
            :: %%i = file extension
            for %%i in (!filetypes!) do (
                choice /c yn /m "Do you wish to delete .%%i files? "
                if !ERRORLEVEL! equ 1 (
                    echo Deleting .%%i files...
                    :: %%a = individual file
                    for /f "delims=" %%a in ('dir /s /b *.%%i') do (
                        choice /c yno /m "Do you wish to delete %%a? "
                        if !ERRORLEVEL! equ 1 (
                            echo Deleting %%a...
                            del "%%a"
                        ) else (
                            if !ERRORLEVEL! equ 2 (
                                echo Skipping %%a...
                            ) else (
                                explorer.exe %%a\..
                            )
                        )
                    )
                ) else (
                    echo Skipping .%%i files...
                )
            )
        )
        echo *** Finished                                                                     ***
        echo ------------------------------------------------------------------------------------
    )
)
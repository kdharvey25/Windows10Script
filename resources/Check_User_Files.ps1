<#
.SYNOPSIS
    This script searches for files with a specified extension in a given directory and its subdirectories.

.DESCRIPTION
    The script takes three parameters: Extension, Path, and Verbose. 
    - Extension: Specifies the file extension to search for. The default value is "txt".
    - Path: Specifies the directory to search in. The default value is "C:\Users".
    - Verbose: Specifies whether to display verbose output. The default value is $false.

.PARAMETER Extension
    Specifies the file extension to search for. The default value is "txt".

.PARAMETER Path
    Specifies the directory to search in. The default value is "C:\Users".

.PARAMETER Verbose
    Specifies whether to display verbose output. The default value is $false.

.EXAMPLE
    Check_User_Files.ps1 -Extension "docx" -Path "C:\Users\JohnDoe" -Verbose $true
    Searches for files with the "docx" extension in the "C:\Users\JohnDoe" directory and its subdirectories, and displays verbose output.

.EXAMPLE
    Check_User_Files.ps1
    Searches for files with the "txt" extension in the "C:\Users" directory and its subdirectories, and does not display verbose output.
#>
param (
    [string]$Extension = "txt",  # Specifies the file extension to search for. Default value is "txt".
    [string]$Path = "C:\Users",   # Specifies the directory to search in. Default value is "C:\Users".
    [bool]$Verbose = $false  # Specifies whether to display verbose output. Default value is $false.
)

$files = Get-ChildItem -LiteralPath "$Path" -Recurse -Force -Filter "*.$extension"  # Retrieves all files with the specified extension in the given directory and its subdirectories.

if ($Verbose) {
    $files | Select-Object @{Name='File Name';Expression={$_.Name}},
                           @{Name='File Length';Expression={$_.Length}},
                           @{Name='File Path';Expression={$_.DirectoryName}} |
            Format-Table -AutoSize
} else {
    foreach ($file in $files) {
        Write-Output $file.FullName    # Outputs the full path of the file.
    }
}



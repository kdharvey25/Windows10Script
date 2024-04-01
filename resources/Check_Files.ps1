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
    [string]$path = "C:\Users",
    [string]$extension = "txt",
    [bool]$Verbose = $false,
    [string]$approvedFileList = "approvedFiles.txt"
)

$approvedFiles = Get-Content -Path $approvedFileList
$files = Get-ChildItem -File -Recurse -LiteralPath "$path" -Filter "*.$extension"

if ($Verbose) {
    foreach ($file in $files) {
        Write-Host ($file.Name -in $approvedFiles)
        if ($file.Name -in $approvedFiles) {
            Write-Host -NoNewline -ForegroundColor Green $file.Name
        } else {
            Write-Host -NoNewline -ForegroundColor Red $file.Name
        }
        Write-Host -NoNewline "`t" $file.Length "`t" $file.FullName
        Write-Host
    }
} else {
    foreach ($file in $files) {
        if ($file.Name -in $approvedFiles) {
            Write-Host -ForegroundColor Green $file.FullName 
        } else {
            Write-Host -ForegroundColor Red $file.FullName
        }
    }
}

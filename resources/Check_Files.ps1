#Self elevate
if(-NOT([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")){   
	$arguments="& '"+$myinvocation.mycommand.definition+"'"
	Start-Process powershell -Verb runAs -ArgumentList $arguments
	Break
}
$path2=Split-Path -Path $PWD -Parent
$path=Get-item $path2/output

# Create a directory to store the search results if it doesn't exist
$outputDirectory = Join-Path $path2 "checkFilesOutput"
if (-not (Test-Path $outputDirectory)) {
    New-Item -ItemType Directory -Path $outputDirectory
}

# Function to search for files by extension
function SearchFilesByExtension($extension) {
    $files = Get-ChildItem -Path C:\ -Filter "*.$extension" -Recurse
    if ($files.Count -gt 0) {
        $outputFile = Join-Path $outputDirectory "$extension.txt"
        $files | ForEach-Object {
            $_.FullName
        } | Out-File $outputFile
    }
}

# Function to search for tools
function SearchForTool($toolName) {
    $files = Get-ChildItem -Path C:\ -Filter "*$toolName*" -Recurse
    if ($files.Count -gt 0) {
        $outputFile = Join-Path $outputDirectory "$toolName.txt"
        $files | ForEach-Object {
            $_.FullName
        } | Out-File $outputFile
    }
}

# Search for files by extension
foreach ($ext in $extensions) {
    Write-Host "Checking for .$ext files"
    SearchFilesByExtension $ext
}

# Search for tools
foreach ($tool in $tools) {
    Write-Host "Checking for $tool"
    SearchForTool $tool
}

Write-Host "Search completed."
#Self elevate
if(-NOT([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")){   
	$arguments="& '"+$myinvocation.mycommand.definition+"'"
	Start-Process powershell -Verb runAs -ArgumentList $arguments
	Break
}
$path2=Split-Path -Path $PWD -Parent
$path=Get-item $path2/output

# File extensions and tools to search for
$extensions = @("aac", "ac3", "avi", "aiff", "bat", "bmp", "exe", "flac", "gif", "jpeg", "jpg", "mov", "m3u", "m4p",
    "mp2", "mp3", "mp4", "mpeg4", "midi", "msi", "ogg", "png", "txt", "sh", "wav", "wma", "vqf")
$tools = @("Cain", "nmap", "keylogger", "Armitage", "Wireshark", "Metasploit", "netcat")

# Create a directory to store the search results if it doesn't exist
$outputDirectory = Join-Path $path "checkFilesOutput"
if (-not (Test-Path $outputDirectory)) {
    New-Item -ItemType Directory -Path $outputDirectory
}

# Function to search for files by extension
function SearchFilesByExtension($extension) {
    $outputFile = Join-Path $outputDirectory "$extension.txt"
    Get-ChildItem -Path C:\ -Filter "*.$extension" -Recurse | ForEach-Object {
        $_.FullName
    } | Out-File $outputFile
}

# Function to search for tools
function SearchForTool($toolName) {
    $outputFile = Join-Path $outputDirectory "$toolName.txt"
    Get-ChildItem -Path C:\ -Filter "*$toolName*" -Recurse | ForEach-Object {
        $_.FullName
    } | Out-File $outputFile
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
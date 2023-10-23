# Get the parent directory of the current directory
$parentDirectory = Split-Path -Path $PWD -Parent

# Display the parent directory path
Write-Host "Parent Directory: $parentDirectory"

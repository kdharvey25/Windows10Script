# Get the parent directory of the current directory
$parentDirectory = Split-Path -Path $PWD -Parent

# Display the parent directory path
Write-Host "Parent Directory: $parentDirectory"


$filePath = "C:\Path\To\Your\File.txt"

# Check if the file exists
if (Test-Path $filePath) {
    # If the file exists, delete it
    Remove-Item $filePath -Force
}

# Create the file (it will be empty)
New-Item -Path $filePath -ItemType File

# You can also write some content to the file if needed
# For example, to create a new file with content:
# "This is the content" | Out-File -FilePath $filePath

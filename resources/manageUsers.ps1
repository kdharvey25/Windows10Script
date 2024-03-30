
$path2 = Get-Item .
$path = Join-Path -path $path2 -ChildPath "users"
# Define the file paths for the lists of approved admins and standard users
$approvedAdminsFile = Join-Path -Path $path -ChildPath "admins.txt"
$approvedUsersFile = Join-Path -Path $path -ChildPath "users.txt"
Write-Host $approvedAdminsFile
Write-Host $approvedUsersFile

# Get the current list of users on the computer
$existingUsers = Get-WmiObject Win32_UserAccount | Where-Object { $_.LocalAccount -eq $true } | Where-Object { $_.Name -ne $currentUsername -and $_.Name -ne 'Administrator' }

# Read the lists of approved admins and users from the text files
$approvedAdmins = Get-Content -Path $approvedAdminsFile
$approvedUsers = Get-Content -Path $approvedUsersFile

# Remove users who are not in the approved lists
foreach ($user in $existingUsers) {
    if ($user.Name -ne "Administrator" -and $user.Name -notin $approvedAdmins -and $user.Name -notin $approvedUsers) {
        net user $user.Name /delete
        Write-Host $user.Name
    }
}

# Add users who should be standard users
foreach ($user in $approvedUsers) {
    if ($user -notin $existingUsers.Name) {
        net user $user NoPtLoss1! /add
    }
}

# Add users who should be administrators
foreach ($user in $approvedAdmins) {
    if ($user -notin $existingUsers.Name) {
        net user $user NoPtLoss! /add
    }
    Add-LocalGroupMember -Group "Administrators" -Member $user
}

# Ensure only approved admins are in the Administrator group
foreach ($user in $existingUsers) {
    if ($user.Name -in $approvedAdmins) {
        if ($user.Name -notin (Get-LocalGroupMember -Group "Administrators").Name) {
            Add-LocalGroupMember -Group "Administrators" -Member $user.Name
        }
    } else {
        if ($user.Name -in (Get-LocalGroupMember -Group "Administrators").Name) {
            Remove-LocalGroupMember -Group "Administrators" -Member $user.Name
        }
    }
}

# Change privileges of admins who are not approved to standard users
foreach ($user in $existingUsers) {
    if ($user.Name -notin $approvedAdmins) {
        net localgroup Administrators $user.Name /delete
    }
}

# Notify that the user management is complete
Write-Host "User management complete."

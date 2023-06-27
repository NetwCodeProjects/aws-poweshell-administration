# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Define variables for user management
$userName = "JohnDoe"

# Prompt the user to select an action for user management
$action = Read-Host "Enter 'group', 'role', or 'both' to remove the user from the group, role, or both"

# Execute the selected action for user management
if ($action -eq "group") {
    $groupName = Read-Host "Enter the name of the IAM group to remove the user from"
    Remove-IAMUserFromGroup -UserName $userName -GroupName $groupName
    Write-Host "User $userName has been removed from group $groupName"
}
elseif ($action -eq "role") {
    $roleName = Read-Host "Enter the name of the IAM role to remove from the user"
    Remove-IAMRoleFromUser -UserName $userName -RoleName $roleName
    Write-Host "Role $roleName has been removed from user $userName"
}
elseif ($action -eq "both") {
    $groupName = Read-Host "Enter the name of the IAM group to remove the user from"
    Remove-IAMUserFromGroup -UserName $userName -GroupName $groupName
    $roleName = Read-Host "Enter the name of the IAM role to remove from the user"
    Remove-IAMRoleFromUser -UserName $userName -RoleName $roleName
    Write-Host "User $userName has been removed from group $groupName and role $roleName"
}
else {
    Write-Host "Invalid action selected"
}

# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Define variables for user management
$userName = "JohnDoe"

# Prompt the user to select an action for user management
$action = Read-Host "Enter 'group', 'role', or 'both' to manage the user's group, role, or both"

# Execute the selected action for user management
if ($action -eq "group") {
    $groupName = Read-Host "Enter the name of the new IAM group for the user"
    Add-IAMUserToGroup -UserName $userName -GroupName $groupName
    Write-Host "User $userName has been added to group $groupName"
}
elseif ($action -eq "role") {
    $roleName = Read-Host "Enter the name of the new IAM role for the user"
    Add-IAMRoleToUser -UserName $userName -RoleName $roleName
    Write-Host "Role $roleName has been added to user $userName"
}
elseif ($action -eq "both") {
    $groupName = Read-Host "Enter the name of the new IAM group for the user"
    Add-IAMUserToGroup -UserName $userName -GroupName $groupName
    $roleName = Read-Host "Enter the name of the new IAM role for the user"
    Add-IAMRoleToUser -UserName $userName -RoleName $roleName
    Write-Host "User $userName has been added to group $groupName and role $roleName"
}
else {
    Write-Host "Invalid action selected"
}

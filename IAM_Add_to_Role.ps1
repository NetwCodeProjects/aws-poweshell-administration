# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Define variables for role assignment
$userName = "JohnDoe"
$roleName = "EC2Admin"

# Check if user exists
$userExists = Get-IAMUser -UserName $userName -ErrorAction SilentlyContinue

# Check if role exists
$roleExists = Get-IAMRole -RoleName $roleName -ErrorAction SilentlyContinue

# If user and role exist, assign role to user
if ($userExists -and $roleExists) {
    Write-Host "Assigning role $roleName to user $userName..."
    $roleArn = (Get-IAMRole -RoleName $roleName).Arn
    New-IAMRolePolicyAttachment -PolicyArn $roleArn -RoleName $roleName -UserName $userName
}
elseif (!$userExists) {
    Write-Host "User $userName does not exist."
}
elseif (!$roleExists) {
    Write-Host "Role $roleName does not exist."
}

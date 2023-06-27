# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Define variables for password reset
$userName = "JohnDoe"
$newPassword = "NewPassword123!"

# Check if user exists
$userExists = Get-IAMUser -UserName $userName -ErrorAction SilentlyContinue

# If user exists, reset password
if ($userExists) {
    Write-Host "Resetting password for user $userName..."
    Set-IAMUserPassword -UserName $userName -NewPassword $newPassword -PasswordResetRequired $false
}
else {
    Write-Host "User $userName does not exist."
}

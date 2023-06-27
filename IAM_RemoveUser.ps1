# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Define variables for user to be deprovisioned
$userName = "JohnDoe"
$groupName = "Developers"

# Check if user exists
$userExists = Get-IAMUser -UserName $userName -ErrorAction SilentlyContinue

# If user exists, remove from group and delete user
if ($userExists) {
    Write-Host "Deprovisioning user: $userName"
    Remove-IAMUserFromGroup -UserName $userName -GroupName $groupName
    Remove-IAMUser -UserName $userName
}
else {
    Write-Host "User $userName does not exist."
}

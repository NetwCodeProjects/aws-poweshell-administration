# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Define variables for new user
$userName = "JohnDoe"
$groupName = "Developers"
$email = "johndoe@example.com"

# Check if user already exists
$userExists = Get-IAMUser -UserName $userName -ErrorAction SilentlyContinue

# If user does not exist, create new user and add to group
if (!$userExists) {
    Write-Host "Creating new user: $userName"
    New-IAMUser -UserName $userName -Path / -Tags @{Name="Email"; Value=$email}
    Add-IAMUserToGroup -UserName $userName -GroupName $groupName
}
else {
    Write-Host "User $userName already exists."
}

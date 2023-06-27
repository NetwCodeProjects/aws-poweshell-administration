# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Get all IAM groups
$groups = Get-IAMGroup

# Loop through each group and list the users in the group
foreach ($group in $groups) {
    Write-Host "Group: $($group.GroupName)"
    $users = Get-IAMGroupUser -GroupName $group.GroupName
    if ($users) {
        foreach ($user in $users) {
            Write-Host "  User: $($user.UserName)"
        }
    }
    else {
        Write-Host "  No users in group"
    }
    Write-Host ""
}

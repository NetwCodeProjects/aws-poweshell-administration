# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Define variables for user management
$userName = "JohnDoe"

# Get the user's groups
$groups = Get-IAMUser -UserName $userName | Select-Object -ExpandProperty Groups
Write-Host "Groups for user $userName:"
if ($groups) {
    foreach ($group in $groups) {
        Write-Host "  $($group.GroupName)"
    }
}
else {
    Write-Host "  User is not a member of any groups"
}
Write-Host ""

# Get the user's roles
$roles = Get-IAMUser -UserName $userName | Select-Object -ExpandProperty AttachedPolicies
Write-Host "Roles for user $userName:"
if ($roles) {
    foreach ($role in $roles) {
        Write-Host "  $($role.PolicyName)"
    }
}
else {
    Write-Host "  User is not associated with any roles"
}
Write-Host ""

# Get the policies that apply to the user
$userPolicies = Get-IAMUserPolicy -UserName $userName | Select-Object -ExpandProperty PolicyName
$groupPolicies = Get-IAMUser -UserName $userName | Select-Object -ExpandProperty GroupPolicyList.PolicyName
$inlinePolicies = Get-IAMUser -UserName $userName | Select-Object -ExpandProperty UserPolicyList.PolicyName
$policies = $userPolicies + $groupPolicies + $inlinePolicies
Write-Host "Policies that apply to user $userName:"
if ($policies) {
    foreach ($policy in $policies) {
        Write-Host "  $policy"
    }
}
else {
    Write-Host "  No policies apply to user"
}

# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Define the IAM role name and policy name
$roleName = "EC2SSMRole"
$policyName = "AmazonEC2RoleforSSM"

# Create the IAM role
$role = New-IAMRole -RoleName $roleName -AssumeRolePolicyDocument `
  '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}'

# Get the AmazonEC2RoleforSSM policy
$policy = Get-IAMPolicy -PolicyName $policyName

# Attach the policy to the role
$role | Add-IAMRolePolicy -PolicyArn $policy.Arn

# Display the IAM role ARN
Write-Host "IAM role ARN: $($role.Arn)"

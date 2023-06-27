# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Specify the instance ID of the EC2 instance to check
$instanceId = "i-0123456789abcdef0"

# Get the instance profile association for the specified instance
$instanceProfileAssociation = Get-IAMInstanceProfileAssociation -InstanceId $instanceId

# Check if the instance has an instance profile association
if ($instanceProfileAssociation) {
    # Get the roles associated with the instance profile
    $roles = $instanceProfileAssociation.IamInstanceProfile.Roles

    # Display the roles associated with the instance profile
    Write-Host "The following roles are associated with the instance profile for instance $instanceId:`n$roles"
} else {
    Write-Host "Instance $instanceId does not have an instance profile association."
}

# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Define variables for patch group creation
$patchGroupName = "MyPatchGroup"
$patchGroupFilter = @{
    "Key" = "tag:Environment"
    "Values" = "Production"
}

# Create the patch group
New-SSMPatchGroup -PatchGroup $patchGroupName -Filters $patchGroupFilter

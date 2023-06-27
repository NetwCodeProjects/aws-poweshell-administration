# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Define variables for patch group creation
$patchGroupName = "MyPatchGroup"
$tagKey = "Environment"
$tagValue = "Production"

# Create the patch group if it doesn't already exist
if (!(Get-SSMPatchGroupList | Select-Object -ExpandProperty PatchGroups | Where-Object { $_ -eq $patchGroupName })) {
    New-SSMPatchGroup -PatchGroup $patchGroupName
}

# Add instances to the patch group using a tag
Add-SSMPatchGroupMembership -PatchGroup $patchGroupName -TagKey $tagKey -TagValue $tagValue

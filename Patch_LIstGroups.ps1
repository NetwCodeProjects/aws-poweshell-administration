# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# List all patch groups
Get-SSMPatchGroupList | Select-Object -ExpandProperty PatchGroups

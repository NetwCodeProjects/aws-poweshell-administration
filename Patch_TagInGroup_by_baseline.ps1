# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Define variables for patch deployment
$patchGroupName = "Production"
$patchFilters = @(
    @{
        "Key" = "PlatformType"
        "Values" = "Linux"
    }
)

# Apply the missing patches on the target instances
Add-SSMPatchBaselineForPatchGroup -PatchGroup $patchGroupName -BaselineName "LinuxBaseline" -PatchFilters $patchFilters

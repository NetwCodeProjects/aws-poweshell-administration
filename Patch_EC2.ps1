# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Define variables for patch deployment
$instanceIds = "i-0123456789abcdefg", "i-0123456789abcdefh" # replace with your own instance IDs
$patchGroup = "my-patch-group" # replace with your own patch group name
$baselineId = "pb-0123456789abcdef" # replace with your own patch baseline ID

# Create a new maintenance window for patching
New-SSMMaintenanceWindow -Name "PatchWindow" -Schedule "cron(0 2 ? * SUN *)" -Duration 2 -Cutoff 1 -AllowUnassociatedTargets

# Register the target instances with the patch group
Register-SSMTargetWithMaintenanceWindow -WindowId "PatchWindow" -ResourceType "INSTANCE" -Targets $instanceIds

# Apply the patch baseline to the patch group
Add-SSMPatchBaselineForPatchGroup -PatchGroup $patchGroup -BaselineId $baselineId

# Run the patch baseline compliance scan
Start-SSMInstanceRefresh -InstanceIds $instanceIds -SchemaVersion 2.0

# Wait for the patch baseline compliance scan to complete
Wait-SSMInstanceRefreshComplete -InstanceIds $instanceIds

# Install the missing patches on the target instances
Invoke-SSMAction -InstanceId $instanceIds -ActionName "AWS-ApplyPatchBaseline" -Parameters @{
    "Operation" = "Install"
    "Name" = $baselineId
}

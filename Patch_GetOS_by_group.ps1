# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Define variables for patch group
$patchGroupName = "Production"

# Get the instances in the patch group
$instances = Get-SSMPatchGroup -GroupName $patchGroupName | Select-Object -ExpandProperty Instances

# Get the operating systems of the instances
$operatingSystems = $instances | ForEach-Object { $_.PlatformName }

# Display the operating systems
$operatingSystems | Select-Object -Unique

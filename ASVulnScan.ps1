# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Get list of EC2 instances
$instances = Get-EC2Instance

# Loop through instances and scan for vulnerabilities
foreach ($instance in $instances) {
    Write-Host "Scanning instance $($instance.InstanceId)..."
    $vulns = Invoke-ASVulnScan -InstanceId $instance.InstanceId
    if ($vulns) {
        Write-Host "Vulnerabilities found on instance $($instance.InstanceId):"
        Write-Host $vulns
    }
    else {
        Write-Host "No vulnerabilities found on instance $($instance.InstanceId)."
    }
}

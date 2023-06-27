# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Define variables for MFA management
$userName = "JohnDoe"

# List all MFA devices for the IAM user
Write-Host "MFA devices for user $userName:"
$mfaDevices = Get-IAMUser -UserName $userName | Select-Object -ExpandProperty MFAdevices
if ($mfaDevices) {
    foreach ($mfaDevice in $mfaDevices) {
        Write-Host "  $($mfaDevice.SerialNumber)"
    }
}
else {
    Write-Host "  No MFA devices registered"
}

# Prompt the user to select an action for MFA management
$action = Read-Host "Enter 'disable' or 'delete' to manage an MFA device for user $userName"

# Execute the selected action for MFA management
if ($action -eq "disable") {
    $serialNumber = Read-Host "Enter the serial number of the MFA device to disable"
    Disable-IAMMFADevice -UserName $userName -SerialNumber $serialNumber
    Write-Host "MFA device $serialNumber has been disabled for user $userName"
}
elseif ($action -eq "delete") {
    $serialNumber = Read-Host "Enter the serial number of the MFA device to delete"
    Remove-IAMMFADevice -UserName $userName -SerialNumber $serialNumber
    Write-Host "MFA device $serialNumber has been deleted for user $userName"
}
else {
    Write-Host "Invalid action selected"
}

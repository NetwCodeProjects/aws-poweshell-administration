# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Get all IAM users
$users = Get-IAMUser

# Loop through each user and list their MFA devices
foreach ($user in $users) {
    Write-Host "User: $($user.UserName)"
    $mfaDevices = $user.MFAdevices
    if ($mfaDevices) {
        foreach ($mfaDevice in $mfaDevices) {
            Write-Host "  MFA Device: $($mfaDevice.SerialNumber)"
        }
    }
    else {
        Write-Host "  No MFA devices registered"
    }
    Write-Host ""
}

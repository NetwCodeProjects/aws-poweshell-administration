# Set AWS credentials
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Define variables for MFA configuration
$userName = "JohnDoe"
$appName = "j_doe_mobile"

# Create a new virtual MFA device
$mfaDevice = New-IAMVirtualMFADevice -Path / -VirtualMFADeviceName $appName

# Get the QR code and secret key for the MFA device
$qrCode = $mfaDevice.QRCodePNG
$secretKey = $mfaDevice.Base32StringSeed

# Display the QR code and secret key for the user to scan and use
Write-Host "Please scan the following QR code in the Google Authenticator app to register your MFA device:"
$qrCode

Write-Host "Please enter the following secret key in the Google Authenticator app to register your MFA device:"
$secretKey

# Wait for the user to complete MFA registration in the app
$confirmation = Read-Host "Press Enter when you have registered your MFA device in the Google Authenticator app"

# Enable the MFA device for the IAM user
$serialNumber = $mfaDevice.SerialNumber
Enable-IAMMFADevice -UserName $userName -SerialNumber $serialNumber

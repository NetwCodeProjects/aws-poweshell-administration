# Authenticate with AWS
Set-AWSCredentials -AccessKey <your access key> -SecretKey <your secret key> -Region <your region>

# Check compliance of S3 bucket with CIS AWS Foundations Benchmark
$bucketName = "my-bucket-name"
$complianceResults = Get-AWSConfigRuleEvaluationStatus -ConfigRuleName "cis-aws-foundations-benchmark" `
    | Where-Object {$_.ResourceId -eq "arn:aws:s3:::$bucketName"}

Write-Host "Compliance status for S3 bucket $bucketName:"
$complianceResults.ComplianceType

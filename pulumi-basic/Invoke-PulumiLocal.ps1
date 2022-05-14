try {
    $env:PULUMI_CONFIG_PASSPHRASE=$passphrase
    Write-Host "Pulumi login"
    pulumi login file://$localPulumiPath

    Write-Host "Pulumi preview + policy pack"
    pulumi preview --policy-pack relativity-crossguard
}
finally {
    pulumi logout
}
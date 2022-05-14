try {
    $env:PULUMI_CONFIG_PASSPHRASE=$passphrase
    Write-Host "Pulumi login"
    pulumi login file://$localPulumiPath

    Write-Host "Pulumi up"
    pulumi up
}
finally {
    pulumi logout
}
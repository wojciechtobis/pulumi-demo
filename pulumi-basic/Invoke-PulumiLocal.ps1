try {
    $env:PULUMI_CONFIG_PASSPHRASE=$passphrase
    Write-Host "Pulumi login"
    pulumi login file://$localPulumiPath

    Write-Host "Pulumi set secret + up"
    pulumi config set --secret custom:secretMetadataValue pulumiIsCool
    pulumi up
}
finally {
    pulumi logout
}
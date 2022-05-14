try {
    $env:PULUMI_CONFIG_PASSPHRASE=$passphrase
    Write-Host "Pulumi login"
    pulumi login file://$localPulumiPath

    Write-Host "Pulumi refresh"
    pulumi refresh

    Write-Host "Pulumi up"
    pulumi up

    # Write-Host "Pulumi refresh + up"
    # pulumi up --refresh
}
finally {
    pulumi logout
}
try {
    $env:PULUMI_CONFIG_PASSPHRASE=$passphrase
    Write-Host "Pulumi login"
    pulumi login file://$localPulumiPath

    Write-Host "Pulumi state delete"
    pulumi state delete urn:pulumi:local::azure-csharp::azure-native:storage:BlobContainer::test4

    Write-Host "Pulumi up"
    pulumi up
}
finally {
    pulumi logout
}
try {
    $env:PULUMI_CONFIG_PASSPHRASE=$passphrase
    Write-Host "Pulumi login"
    pulumi login file://$localPulumiPath

    Write-Host "Pulumi up"
    pulumi up

    # Write-Host "Pulumi import"
    # pulumi import azure-native:storage:BlobContainer test4 /subscriptions/$subscriptionId/resourceGroups/Pulumi-basic-local-demo/providers/Microsoft.Storage/storageAccounts/pulumisae037acfb/blobServices/default/containers/test4
}
finally {
    pulumi logout
}
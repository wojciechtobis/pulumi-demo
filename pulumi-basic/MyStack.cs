using System.Collections.Generic;
using Pulumi;
using Pulumi.AzureNative.Resources;
using Pulumi.AzureNative.Storage;
using Pulumi.AzureNative.Storage.Inputs;

internal class MyStack : Stack
{
    public MyStack()
    {
        var azureNativeConfig = new Config("azure-native");
        var location = azureNativeConfig.Require("location");

        var customConfig = new Config("custom");
        var resourceGroupName = customConfig.Require("resourceGroupName");
        var storageAccountName = customConfig.Require("storageAccountName");

        var resourceGroup = new ResourceGroup(resourceGroupName, new ResourceGroupArgs
        {
            Location = location,
            ResourceGroupName = resourceGroupName,
        });

        var storageAccount = new StorageAccount(storageAccountName, new StorageAccountArgs
        {
            ResourceGroupName = resourceGroup.Name,
            AccountName = storageAccountName,
            Sku = new SkuArgs
            {
                Name = SkuName.Standard_ZRS
            },
            Kind = Kind.Storage
        });

        // Secret metadata container
        const string containerName = "test1";
        
        var metadata = customConfig
            .RequireSecret("secretMetadataValue")
            .Apply(s => new Dictionary<string, string>
                {
                    { "secretMessage", s },
                });

        _ = new BlobContainer(containerName, new BlobContainerArgs
        {
            AccountName = storageAccount.Name,
            ContainerName = containerName,
            ResourceGroupName = resourceGroup.Name,
            PublicAccess = PublicAccess.None,
            DenyEncryptionScopeOverride = false,
            DefaultEncryptionScope = "$account-encryption-key",
            Metadata = metadata
        });
    }
}
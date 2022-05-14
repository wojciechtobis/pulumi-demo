import * as azure from "@pulumi/azure-native";
import { Policies, validateResourceOfType } from "@pulumi/policy";

export function GetSecurityPolicies() : Policies {
    return [
        {
            name: "storage-container-no-public-read",
            description: "Prohibits setting the public permission on Azure Storage Blob Containers.",
            enforcementLevel: "mandatory",
            validateResource: validateResourceOfType(azure.storage.BlobContainer, (container, args, reportViolation) => {
                if (container.publicAccess !== azure.storage.PublicAccess.None) {
                    reportViolation(
                        "Azure Storage Container must not have blob or container access set. " +
                        "Read more about read access here: " +
                        "https://docs.microsoft.com/en-us/azure/storage/blobs/storage-manage-access-to-resources");
                }
            }),
        }
    ]
}

import * as azure from "@pulumi/azure-native";
import { Policies, validateResourceOfType } from "@pulumi/policy";

export function GetBestPracticesPolicies() : Policies {
    return [
        {
            name: "storage-container-name",
            description: "Prohibits setting the Storage Container name that contains 'test'",
            enforcementLevel: "mandatory",
            validateResource: validateResourceOfType(azure.storage.BlobContainer, (container, args, reportViolation) => {
                if (container.containerName?.toLowerCase().includes("test")) {
                    reportViolation("Azure Storage Container should not contain 'test' in its name.");
                }
            }),
        }
    ]
}

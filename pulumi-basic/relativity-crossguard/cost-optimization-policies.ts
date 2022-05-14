import * as azure from "@pulumi/azure-native";
import { Policies, validateResourceOfType } from "@pulumi/policy";

export function GetCostOptimizationPolicies() : Policies {
    return [
        {
            name: "service-plan-sku",
            description: "Prohibits setting premium Service Plan",
            enforcementLevel: "mandatory",
            validateResource: validateResourceOfType(azure.web.AppServicePlan, (appServicePlan, args, reportViolation) => {
                if (appServicePlan.sku?.tier?.toLowerCase()?.includes("premium")) {
                    reportViolation("Premium service plans cost too much.");
                }
            }),
        }
    ]
}

import { PolicyPack, Policies } from "@pulumi/policy";

import { GetSecurityPolicies } from "./security-policies";
import { GetCostOptimizationPolicies } from "./cost-optimization-policies";
import { GetBestPracticesPolicies } from "./best-practices-policies";

const policies : Policies = [
    ...GetSecurityPolicies(),
    ...GetCostOptimizationPolicies(),
    ...GetBestPracticesPolicies()
]

new PolicyPack("relativity-policies", {
    policies: policies,
});
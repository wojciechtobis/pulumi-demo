try {
    Write-Host "Terraform init"
    terraform init `
        -input=false

    Write-Host "Terraform plan"
    terraform plan `
        -var subscription_id=$subscriptionId `
        -var client_id=$clientId `
        -var client_secret=$clientSecret `
        -var tenant_id=$tenantId `
        -out="tfplan"

    Write-Host "Terraform apply"
    terraform apply "tfplan"

    # Write-Host "Terraform destroy"
    # terraform destroy `
    #     -var subscription_id=$subscriptionId `
    #     -var client_id=$clientId `
    #     -var client_secret=$clientSecret `
    #     -var tenant_id=$tenantId
}
finally {
      if (Test-Path ".terraform/") {
        Remove-Item -Path ".terraform" -Recurse
      }
      if (Test-Path "tfplan") {
        Remove-Item -Path "tfplan" -Recurse
      }
      if (Test-Path ".terraform.lock.hcl") {
        Remove-Item -Path ".terraform.lock.hcl"
      }
}
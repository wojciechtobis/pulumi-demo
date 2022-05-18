# Pulumi demo

This repository contains Pulumi examples.

## Prerequisites 

### Required software
Before you start, please install the latest versions of:
- [Pulumi](https://www.pulumi.com/docs/get-started/install/)
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- [.NET](https://dotnet.microsoft.com/en-us/download)
- [Node.js](https://nodejs.org/en/download/)

### Azure
You need to have an active Azure subscription and dedicated Service Principal with access to that subscription.

### Pulumi
If you want to use [Pulumi Service](https://app.pulumi.com/), you need to create an account.

## Initial setup

### Pulumi
Required stacks:
- In Pulumi Service we need to have a stack with name: `pulumi-service`. If you already have other stack and want to reuse it, please update `Pulumi.pulumi-service.yaml` name with your stack name.
- We need to have a stack with name: `local` created locally. If you already have other stack and want to reuse it, please update `Pulumi.local.yaml` name with your stack name.

### Environment variables
Set the following environment variables:
- $tenantId - your Azure Tenand ID
- $subscriptionId - your Azure Subscription ID
- $clientId - client ID of dedicated Service Principal
- $clientSecret - client secret of dedicated Service Principal
- $passphrase - a passphrase that was used during local stack creation
- $localPulumiPath - path to the folder with your local Pulumi objects. Will be used in login command `pulumi login file://$localPulumiPath`

### Azure login
Login to your Azure account
``` 
az login
```
and set default subscription.
```
az account set --subscription=<id>
```
More info about Azure Native configuration for Pulumi can be found [here](https://www.pulumi.com/registry/packages/azure-native/installation-configuration/)

## Available branches
With this repository you can test different Pulumi operations. To use it properly, you can switch between branches:
- `0-basic-operations`
- `1-refresh-operation`
- `2-import-operation`
- `3-delete-operation`
- `4-secret-config`
- `5-crossguard` - important, before this exercise please navigate to `pulumi-basic\relativity-crossguard` folder and execute `npm install` 
- `6-automation-api`
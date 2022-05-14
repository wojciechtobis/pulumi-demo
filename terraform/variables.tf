provider "azurerm" {
    subscription_id = "${var.subscription_id}"
    client_id       = "${var.client_id}"
    client_secret   = "${var.client_secret}"
    tenant_id       = "${var.tenant_id}"
    features {}
}
  
variable "subscription_id" {
    type = string
    description = "The subscription_id which should be used"
}

variable "client_id" {
    type = string
    description = "The client_id which should be used"
}

variable "client_secret" {
    type = string
    description = "The Azure client_id secret"
}

variable "tenant_id" {
    type = string
    description = "The Azure tenant_id"
}

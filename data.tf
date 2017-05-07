terraform {
  backend "azure" {
    storage_account_name = "vibratoremotestate"
    container_name       = "terraform-state"
    key                  = "azure-containers.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
  skip_provider_registration = true
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = "2048"
}


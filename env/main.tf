provider "azurerm" {
    version = "1.27"
    subscription_id = "${var.subscription-id}"
    client_id       = "${var.client-id}"
    client_secret   = "${var.client-secret}"
    tenant_id       = "${var.tenant-id}"
}

resource "azurerm_resource_group" "test" {
  name     = "ad-resources"
  location = "eastasia"
}
resource "azurerm_virtual_network" "test" {
  name                = "virtualNetwork1"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  address_space       = ["10.0.2.0/24"]
  dns_servers         = ["10.0.2.4", "8.8.8.8"]
  }
resource "azurerm_subnet" "adds" {
  name                 = "adds-services"
  resource_group_name  = "${azurerm_resource_group.test.name}"
  virtual_network_name = "${azurerm_virtual_network.test.name}"
  address_prefix       = "10.0.2.128/25"
}
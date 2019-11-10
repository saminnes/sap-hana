resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = "${azurerm_resource_group.test.name}"
    }
    
    byte_length = 8
}
resource "azurerm_storage_account" "mgmtdiagstorageaccount" {
    name                = "diagmgt${random_id.randomId.hex}"
    resource_group_name = "${azurerm_resource_group.test.name}"
    location            = "${azurerm_resource_group.test.location}"
    account_replication_type = "LRS"
    enable_https_traffic_only = true
    account_tier = "Standard"
}
#Create Management VM
resource "azurerm_network_interface" "mgmt1nic" {
    name                = "dc01-nic"
    location            = "${azurerm_resource_group.test.location}"
    resource_group_name = "${azurerm_resource_group.test.name}"
    
    ip_configuration {
        name                          = "dc01-ip"
        subnet_id                     = "${azurerm_subnet.adds.id}"
        private_ip_address_allocation = "Dynamic"
    }
}
resource "azurerm_virtual_machine" "mgmtvm1" {
    name                  = "dc01"
    location              = "${azurerm_resource_group.test.location}"
    resource_group_name   = "${azurerm_resource_group.test.name}"
    network_interface_ids = ["${azurerm_network_interface.mgmt1nic.id}"]
    vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "dc01-os"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name      = "dc01"
    admin_username     = "samadmin"
    admin_password     = "Pass12349876"

  }

  os_profile_windows_config {
      provision_vm_agent = true
  }
    boot_diagnostics {
        enabled     = "true"
        storage_uri = "${azurerm_storage_account.mgmtdiagstorageaccount.primary_blob_endpoint}"
    }
}
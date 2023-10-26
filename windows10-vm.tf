resource "azurerm_network_interface" "win10nic" {
  name                = "nic-windows10-vm"
  location            = var.location
  resource_group_name = azurerm_resource_group.myterraformgroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.privatesubnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.1.1.5"
  }
}

resource "azurerm_windows_virtual_machine" "windows10-vm" {
  name                = "windows10-vm"
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "azureadmin"
  admin_password      = "Fortinet123#"
  network_interface_ids = [
    azurerm_network_interface.win10nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "Windows-10"
    sku       = "20h2-pro"
    version   = "latest"
  }
}

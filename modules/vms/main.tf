resource "azurerm_linux_virtual_machine" "example" {
  count               = 2
  name                = "L2ProjectX-VM-${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_D4s_v3"
  admin_username      = "adminuser"
  admin_password      = "Pa$$w0rd1234!" # Use Azure Key Vault for sensitive info

  network_interface_ids = [azurerm_network_interface.main[count.index].id]

  os_disk {
    caching              = "ReadWrite"
    create_option        = "FromImage"
    managed_disk_type    = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "main" {
  count               = 2
  name                = "L2ProjectX-NIC-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                    = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "Terraform"
  }
}

output "vm_ids" {
  value = azurerm_linux_virtual_machine.example[*].id
}
resource "azurerm_network_interface" "vm_nic" {
  count               = 2
  name                = "${var.project_name}-nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                    = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
    load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.main.id]
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  count               = 2
  name                = "${var.project_name}-vm-${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_DS4_v2"  # 4 CPU, 16GB RAM
  admin_username      = "adminuser"
  admin_password      = "Password1234!"  # Use a more secure way to manage passwords
  network_interface_ids = [azurerm_network_interface.vm_nic[count.index].id]

  os_disk {
    caching              = "ReadWrite"
    create_option       = "FromImage"
    managed_disk_type   = "StandardSSD_LRS"
    disk_size_gb        = 120
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

output "vm_ids" {
  value = azurerm_linux_virtual_machine.main[*].id
}

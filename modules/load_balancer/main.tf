resource "azurerm_lb" "main" {
  name                = "L2ProjectX-LB"
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name = "FrontendConfig"
    public_ip_address_id = var.public_ip_address_id
  }

  backend_address_pool {
    name = "backendpool"
  }

  probe {
    name                = "healthprobe"
    protocol            = "Tcp"
    port                = 80
    interval_in_seconds = 5
    number_of_probes    = 2
  }

  load_balancing_rule {
    name                           = "HttpRule"
    protocol                       = "Tcp"
    frontend_port                  = 80
    backend_port                   = 80
    frontend_ip_configuration_name = "FrontendConfig"
    backend_address_pool_id       = azurerm_lb.main.backend_address_pool[0].id
  }
}

output "backend_address_pool_id" {
  value = azurerm_lb.main.backend_address_pool[0].id
}
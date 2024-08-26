provider "azurerm" {
  features {}
}

module "network" {
  source       = "./modules/network"
  project_name = "L2ProjectX"
}

module "firewall" {
  source       = "./modules/firewall"
  network_name = module.network.network_name
  project_name = "L2ProjectX"
}

module "vm" {
  source       = "./modules/vm"
  project_name = "L2ProjectX"
  network_name = module.network.network_name
  public_ip    = module.network.public_ip
  security_rule_id = module.firewall.security_rule_id
}

output "vm_ids" {
  value = module.vm.vm_ids
}

module "network" {
  source = "./modules/network"
  resource_group_name = var.resource_group_name
  location = var.location
}

module "vms" {
  source = "./modules/vms"
  resource_group_name = var.resource_group_name
  location = var.location
  public_ip_address_id = module.network.public_ip_address_id
  subnet_id = module.network.subnet_id
}

module "load_balancer" {
  source = "./modules/load_balancer"
  resource_group_name = var.resource_group_name
  location = var.location
  backend_address_pool_id = module.load_balancer.backend_address_pool_id
  virtual_machine_ids = module.vms.vm_ids
}
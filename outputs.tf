output "public_ip" {
  value = module.network.public_ip_address
}

output "vm_ids" {
  value = module.vms.vm_ids
}
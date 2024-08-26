output "vm_ids" {
  description = "The list of VM IDs"
  value       = azurerm_linux_virtual_machine.main[*].id
}

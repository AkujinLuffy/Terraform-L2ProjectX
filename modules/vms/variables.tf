variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "public_ip" {
  description = "The public IP address"
  type        = string
}

variable "security_rule_id" {
  description = "The security rule ID for the firewall"
  type        = string
}

variable "resource_group_name" {
  type        = string
  description = "(Required) Name of Resource Group"
}

variable "resource_group_location" {
  type        = string
  description = "(Required) Location where we want to implement code"
}

variable "virtual_network_name" {
  type        = string
  description = "(Required) Name of Virtual Network"
}


# Define bastion subnet addr prefix
variable "bastion_subnet_addr_prefix" {
  type        = list(string)
  description = "(Required) Ip address range of subnet"
}

variable "ip_allocation" {
  type        = string
  default     = "Static"
  description = "(Required) IP allocation method"
}

variable "sku" {
  type        = string
  default     = "Standard"
  description = "(Required) SKU type"
}

variable "bastion_tags" {
  type        = map(string)
  default     = {}
  description = "(Optional) Tag which will associated to the Bastion Host."
}

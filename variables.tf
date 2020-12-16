variable "bastion_subnet_name" {
    type = string
    default = "AzureBastionSubnet"
}

variable "bastion_subnet_rg_name" {}

variable "bastion_subnet_vnet_name" {}

variable "bastion_subnet_addr" {
    # default    = ["10.1.1.224/27"]
}

variable "bastion_name" {
    type = string
    default = "TfBastionHost"
}

variable "bastion_location" {}

variable "bastion_rg_name" {}

variable "bastion_ip_name" {
    default = "TerraformBastionIp"
}

variable "bastion_publicIp_Id" {}

variable "bastion_tag"{
    type = map(string)
    default = {
	env:"dev"
	}
}
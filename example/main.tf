terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.46.0"
    }
  }

  required_version = ">= 0.15"
}

provider "azurerm" {
  features {}
}

module "res_group" {
  source                  = "git::https://github.com/OT-terraform-azure-modules/azure_resource_group.git"
  resource_group_name     = "azdev"
  resource_group_location = "West Europe"
  lock_level_value        = ""
  tag_map = {
    Name = "AzureRG"
  }
}

module "vnet" {
  source        = "git::https://github.com/OT-terraform-azure-modules/terraform-azure-virtual-network.git"
  rg_name       = module.res_group.resource_group_name
  vnet_location = module.res_group.resource_group_location
  address_space = ["10.0.0.0/16"]
  vnet_name     = "anant-vnet"
  dns_servers   = ["10.0.0.4", "10.0.0.5"]
}

module "bation_module" {
  source                     = "git::https://github.com/OT-terraform-azure-modules/terraform-azure-bastion.git"
  resource_group_name        = module.res_group.resource_group_name
  resource_group_location    = module.res_group.resource_group_location
  virtual_network_name       = module.vnet.vnet_name
  bastion_subnet_addr_prefix = ["10.0.1.192/27"]
  ip_allocation              = "Static"
  sku                        = "Standard"
  bastion_tags = {
    env = "Azdev"
  }
}

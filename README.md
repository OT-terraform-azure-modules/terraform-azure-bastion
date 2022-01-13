Azure Bastion Host Terraform Module
=====================================

[![Opstree Solutions][opstree_avatar]][opstree_homepage]

[Opstree Solutions][opstree_homepage]

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

Terraform module which creates Bastion Host on Azure .

Terraform versions
------------------
Terraform v0.15.4


Usage
------

```hcl
module "res_group" {
  source                  = "git::https://github.com/OT-terraform-azure-modules/azure_resource_group.git"
  resource_group_name     = "_"
  resource_group_location = "_"
  lock_level_value        = ""
  tag_map = {
    Name = "AzureResourceGroup"
  }
}

module "vnet" {
  source        = "git::https://github.com/OT-terraform-azure-modules/terraform-azure-virtual-network.git"
  rg_name       = module.res_group.resource_group_name
  vnet_location = module.res_group.resource_group_location
  address_space = ["_"]
  vnet_name     = ""
  dns_servers   = ["_", "_"]
}

module "bation_module" {
  source                     = "git::https://github.com/OT-terraform-azure-modules/terraform-azure-bastion.git"
  resource_group_name        = module.res_group.resource_group_name
  resource_group_location    = module.res_group.resource_group_location
  virtual_network_name       = module.vnet.vnet_name
  bastion_subnet_addr_prefix = ["_"]
  bastion_tags = {
    tag1 = "value1"
    tag2 = "value2"
  }
}
```

Resources
------
| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_virtual_network.Vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_public_ip.IP](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/public_ip) | resource |
| [azurerm_subnet.Bastion_Subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | resource |
| [azurerm_bastion_host.Bastion_Host](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host) | resource |


Inputs
------
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource_group_name | Name of Resource Group | `string` |  | yes |
| resource_group_location | Location where we want to implement code | `string` |  | yes |
| vnet_name | The name of the virtual network. Changing this forces a new resource to be created. | `string` | | yes |
| address_prefixes | The address space that is used by bastion host | `list(string)` | | yes |
| bastion_Subnet | Create Subnet for Bastion Host | `string` | `AzureBastionSubnet` | no |
| public_ip_Name | Create Public Ip of Bastion Resource | `string` | | yes |
| ip_allocation_method | Need Ip address type | `string` | `"Static"` | no |
| sku_type | Stock-keeping-Unit | `string` | `"Standard"` | no |
| bastion_Host_Name | Name of Bastion Host | `string` | | yes |
| bastion_Host_Location | location of bastion host | `string` | | yes |
| bastion_tags | tags of bastion host | `map(string)` | | no |


Output
------
| Name | Description |
|------|-------------|  
| bastionhost_name | Name of bastion host |
| bastionhost_subnet | Name of bastion host subnet |
| bastionhost_subnetid | Bastion host subnet ID |
| bastionhost_ip | Bastion Host Ip address |


### Contributors

|  [![Anant Chauhan][Anant_avatar]][Anant_homepage]<br/>[Anant Chauhan][Anant_homepage] |
|---|

  [anant_homepage]: https://gitlab.com/anant.chauhan1
  [anant_avatar]: https://gitlab.com/uploads/-/system/user/avatar/9372704/avatar.png?width=400

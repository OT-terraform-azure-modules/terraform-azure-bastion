Azure Bastion Host Terraform module
=====================================

[![Opstree Solutions][opstree_avatar]][opstree_homepage]

[Opstree Solutions][opstree_homepage] 

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

Terraform module which creates Azure Bastion.

These types of resources are supported:

* [Bastion](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host)

Terraform versions
------------------

Terraform 0.13.

Usage
------

```hcl
module "bastion" {
  source = "git::https://github.com/OT-terraform-azure-modules/terraform-azure-bastion.git"
  bastion_rg_name = azurerm_resource_group.RG.name
  bastion_subnet_addr = ["10.0.0.2/24"]
  bastion_subnet_rg_name = azurerm_resource_group.RG.name
  bastion_subnet_vnet_name = azurerm_virtual_network.terraformvnet.name
  bastion_location = azurerm_resource_group.RG.location
  bastion_publicIp_Id = azurerm_public_ip.example.id
  bastion_tag = {
      env:"stage"
  }
}

```


Tags
----
* Tags are assigned to resources with name variable as prefix.
* Additial tags can be assigned by tags variables as defined above.

Inputs
------
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bastion_name | Name of the bastion host | `string` | `"otbastion"` | no |
| bastion_location | Location in which the Bastion host would be created | `string` | `"eastus"` | yes |
| bastion_tag | tag to associate with te Bastion host | `string` | `"dev"` | no |

Output
------
| Name | Description |
|------|-------------|
|bastion_Id |ID of the bastion host |

## Related Projects

Check out these related projects. 
* [Bastion Implementation](https://github.com/naveenverma023/terraform-azure-bastion-setup/tree/feature/bastionImplementation)
  
### Contributors

|  [![Naveen Verma][naveen_avatar]][naveen_homepage]<br/>[Naveen Verma][naveen_homepage] |
|---|

  [naveen_homepage]: https://github.com/naveenverma023
  [naveen_avatar]: https://avatars2.githubusercontent.com/u/61639221?s=400&u=de7879e92ac9cff3d9ababff74c1b593d13302ca&v=4

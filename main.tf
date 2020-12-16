resource "random_string" "random" {
  length = 4
  special = false
  upper   = false
  number  = false
}

resource "azurerm_subnet" "TerraformBastionSubnet" {
  name                 = var.bastion_subnet_name
  resource_group_name  = var.bastion_subnet_rg_name
  virtual_network_name = var.bastion_subnet_vnet_name
  address_prefixes     = var.bastion_subnet_addr
}

resource "azurerm_public_ip" "TerraformBastionIp" {
  name                = join("-",[var.bastion_ip_name, random_string.random.result])
  location            = var.bastion_location
  resource_group_name = var.bastion_subnet_rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "TerraformBastion" {
  name                = join("-",[var.bastion_name, random_string.random.result])
  location            = var.bastion_location
  resource_group_name = var.bastion_rg_name

  ip_configuration {
    name                 = var.bastion_ip_name
    subnet_id            = azurerm_subnet.TerraformBastionSubnet.id
    public_ip_address_id = azurerm_public_ip.TerraformBastionIp.id
  }

  var.bastion_tag= {
      Name = "dev"
  }
}
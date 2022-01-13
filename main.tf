# create bastion subnet 
resource "azurerm_subnet" "subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.bastion_subnet_addr_prefix

}

# The public IP of the Bastion resource 
resource "azurerm_public_ip" "pubip" {
  name                = "${var.resource_group_name}-PUBIP"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = var.ip_allocation
  sku                 = var.sku

}

# create bastion host
resource "azurerm_bastion_host" "bastion" {
  name                = "${var.resource_group_name}-bastion_host"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  tags                = var.bastion_tags


  ip_configuration {
    name                 = "${var.resource_group_name}-configuration"
    subnet_id            = azurerm_subnet.subnet.id
    public_ip_address_id = azurerm_public_ip.pubip.id
  }

}
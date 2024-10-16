resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = merge(
    {
      owner       = var.owner_tag
      environment = var.environment_tag
    },
    var.vnet_tags
  )
}
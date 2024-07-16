resource "azurerm_resource_group" "main" {

    location = var.location

    name = "${var.prefix}-${var.resource_group_name}"
}

module "aks_vnet" {
  source  = "Azure/vnet/azurerm"
  version = "4.1.0"

  resource_group_name = azurerm_resource_group.main.name
  vnet_location       = azurerm_resource_group.main.location
  use_for_each        = true

  vnet_name       = "${var.prefix}-${var.vnet_name}"
  address_space   = var.vnet_address_space
  subnet_names    = keys(var.subnet_configuration)
  subnet_prefixes = values(var.subnet_configuration)

  tags = var.common_tags

}
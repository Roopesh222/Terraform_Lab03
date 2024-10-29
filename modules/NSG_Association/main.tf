data "azurerm_network_security_group" "network_security_group_association" {
  for_each            = var.nsg_association_variable
  name                = each.value["nsg_name"]
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "subnet" {
  for_each             = var.nsg_association_variable
  name                 = each.value["subnet_name"]
  virtual_network_name = each.value["vnet_name"]
  resource_group_name  = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "db_nsg_association" {
  for_each                  = var.nsg_association_variable
  subnet_id                 = data.azurerm_subnet.subnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.network_security_group_association[each.key].id
}
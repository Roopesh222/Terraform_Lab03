data "azurerm_subnet" "subnet" {
  for_each             = var.storage_account_variable
  name                 = each.value["subnet_name"]
  virtual_network_name = each.value["vnet_name"]
  resource_group_name  = var.resource_group_name
}
resource "azurerm_storage_account" "example" {
  for_each                 = var.storage_account_variable
  name                     = each.value["name"]
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = each.value["account_tier"]
  account_replication_type = each.value["account_replication_type"]
  network_rules {
    default_action             = "Deny"
    virtual_network_subnet_ids = [data.azurerm_subnet.subnet[each.key].id]
  }
}
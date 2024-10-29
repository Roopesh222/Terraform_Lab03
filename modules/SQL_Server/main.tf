resource "azurerm_mssql_server" "sql_server" {
  for_each                     = var.sql_server_variable
  name                         = each.value["name"]
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = each.value["version"]
  administrator_login          = each.value["administrator_login"]
  administrator_login_password = each.value["administrator_login_password"]
  minimum_tls_version          = each.value["minimum_tls_version"]
}
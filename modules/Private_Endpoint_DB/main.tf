data "azurerm_mssql_server" "sql_server" {
  for_each            = var.private_endpoint_variable
  name                = each.value["server_name"]
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "subnet" {
  for_each             = var.private_endpoint_variable
  name                 = each.value["subnet_name"]
  virtual_network_name = each.value["vnet_name"]
  resource_group_name  = var.resource_group_name
}

resource "azurerm_private_endpoint" "private_endpoint" {
  for_each            = var.private_endpoint_variable
  name                = each.value["name"]
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = data.azurerm_subnet.subnet[each.key].id

  private_service_connection {
    name                           = "sqlPrivateConnection"
    is_manual_connection           = false
    private_connection_resource_id = data.azurerm_mssql_server.sql_server[each.key].id # Use the SQL Server resource ID
    subresource_names              = ["sqlServer"]                                     # Correct subresource for SQL Server
  }

  lifecycle {
    ignore_changes = [private_service_connection, subnet_id, private_dns_zone_group]
  }
}
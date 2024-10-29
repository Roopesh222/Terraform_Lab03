
resource "azurerm_sql_database" "sql_database" {
  for_each            = var.sql_database_variable
  name                = each.value["name"]
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = each.value["mssql_server_name"]
  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
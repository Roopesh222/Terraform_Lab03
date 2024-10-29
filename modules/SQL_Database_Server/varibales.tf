variable "sql_database_variable" {
  type = map(object({
    name              = string
    mssql_server_name = string
  }))
}

variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
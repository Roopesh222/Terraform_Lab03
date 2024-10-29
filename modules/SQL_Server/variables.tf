variable "sql_server_variable" {
  type = map(object({
    name                         = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
  }))
}

variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
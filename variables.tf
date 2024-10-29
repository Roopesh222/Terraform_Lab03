variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}

variable "virtual_network_variable" {
  type = map(object({
    name          = string
    address_space = list(string)
  }))
}

variable "subnet_variable" {
  type = map(object({
    virtual_network_name = string
    name                 = string
    address_prefixes     = list(string)
    service_endpoints    = list(string)
  }))
}

variable "nsg_variable" {
  type = map(object({
    name = string
  }))
}

variable "nsg_association_variable" {
  type = map(object({
    nsg_name    = string
    vnet_name   = string
    subnet_name = string
  }))
}


variable "security_rule_variable" {
  type = map(object({
    name                        = string
    priority                    = number
    direction                   = string
    access                      = string
    protocol                    = string
    source_port_range           = string
    destination_port_range      = string
    source_address_prefix       = string
    destination_address_prefix  = list(string)
    network_security_group_name = string
  }))
}

variable "sql_server_variable" {
  type = map(object({
    name                         = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string

  }))
}

variable "sql_database_variable" {
  type = map(object({
    name              = string
    mssql_server_name = string
  }))
}

variable "private_endpoint_variable" {
  type = map(object({
    server_name = string
    subnet_name = string
    vnet_name   = string
    name        = string
    # psc_name             = string
    # is_manual_connection = bool
    # request_message      = string
    # # subresource_names    = list(string)
  }))
}

variable "storage_account_variable" {
  type = map(object({
    subnet_name              = string
    vnet_name                = string
    name                     = string
    account_tier             = string
    account_replication_type = string
  }))
}
resource_group_name = "Lab03_rg"
location            = "westus"


virtual_network_variable = {
  vnet01 = {
    name          = "Lab03_Vnet"
    address_space = ["10.0.0.0/16"]
  }
}

subnet_variable = {
  "subnet01" = {
    virtual_network_name = "Lab03_Vnet"
    name                 = "Database_subnet"
    address_prefixes     = ["10.0.1.0/24"]
    service_endpoints    = ["Microsoft.Storage"]

  },
  "subnet02" = {
    virtual_network_name = "Lab03_Vnet"
    name                 = "Other_resource_subnet"
    address_prefixes     = ["10.0.2.0/24"]
    service_endpoints    = ["Microsoft.Storage"]
  }
}

nsg_variable = {
  "nsg03" = {
    name = "lab03_nsg"
  }
}

nsg_association_variable = {
  "association01" = {
    nsg_name    = "lab03_nsg"
    vnet_name   = "Lab03_Vnet"
    subnet_name = "Database_subnet"
  }
}

security_rule_variable = {
  "security_rule_01" = {
    name                        = "Allow-SQL-Access"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "1433"
    source_address_prefix       = "*"
    destination_address_prefix  = ["10.0.1.0/24"]
    network_security_group_name = "lab03_nsg"
  },
  "security_rule_02" = {
    name                        = "Deny-All-Inbound"
    priority                    = 200
    direction                   = "Inbound"
    access                      = "Deny"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = ["10.0.1.0/24"]
    network_security_group_name = "lab03_nsg"
  }
}

sql_server_variable = {
  "sql_server" = {
    name                         = "roopeshsqlserver"
    version                      = "12.0"
    administrator_login          = "Ropesh"
    administrator_login_password = "Roopesh@#123"
    minimum_tls_version          = "1.2"
  }
}

sql_database_variable = {
  "sql_database" = {
    name              = "mylabdbserver"
    mssql_server_name = "roopeshsqlserver"
  }
}

private_endpoint_variable = {
  "pvt_endpoint_db" = {
    server_name = "roopeshsqlserver"
    subnet_name = "Database_subnet"
    vnet_name   = "Lab03_Vnet"
    name        = "sql_database_server_endpoint"
    # psc_name             = "psconnection"
    # is_manual_connection = true
    # request_message      = "PL"
    # # subresource_names    = ["blob"]
  }
}

storage_account_variable = {
  "sttg01" = {
    subnet_name              = "Database_subnet"
    vnet_name                = "Lab03_Vnet"
    name                     = "roopeshsttgacc"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}
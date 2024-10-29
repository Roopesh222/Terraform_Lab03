########################### RG ###########################
module "rg_module" {
  source              = "./modules/Resource_Group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

########################### Vnet ##########################
module "vnet_module" {
  source                   = "./modules/Virtual_Network"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  virtual_network_variable = var.virtual_network_variable
  depends_on               = [module.rg_module]
}

######################### SUBNET ####################
module "subnet_module" {
  source              = "./modules/Subnets"
  resource_group_name = var.resource_group_name
  subnet_variable     = var.subnet_variable
  depends_on          = [module.vnet_module, module.rg_module]
}

##################### NSG ##########################
module "nsg_module" {
  source              = "./modules/NSG"
  location            = var.location
  resource_group_name = var.resource_group_name
  nsg_variable        = var.nsg_variable
  depends_on          = [module.rg_module]
}

################# NSG ASSOCIATION ##################

module "nsg_association_module" {
  source                   = "./modules/NSG_Association"
  resource_group_name      = var.resource_group_name
  nsg_association_variable = var.nsg_association_variable
  depends_on               = [module.nsg_module, module.subnet_module, module.rg_module]
}

#################### Security Rules ####################
module "security_rule_module" {
  source                 = "./modules/security_rules"
  security_rule_variable = var.security_rule_variable
  resource_group_name    = var.resource_group_name
  depends_on             = [module.nsg_module, module.rg_module]
}

##################### SQL Server ######################
module "sql_server_module" {
  source              = "./modules/SQL_Server"
  resource_group_name = var.resource_group_name
  location            = var.location
  sql_server_variable = var.sql_server_variable
  depends_on          = [module.rg_module, module.vnet_module, module.nsg_module]
}

##################### Database Server ######################
module "database_server_module" {
  source                = "./modules/SQL_Database_Server"
  resource_group_name   = var.resource_group_name
  location              = var.location
  sql_database_variable = var.sql_database_variable
  depends_on            = [module.sql_server_module, module.rg_module]
}

######################### private endpoint #########################
module "private_endpoint_module" {
  source                    = "./modules/Private_Endpoint_DB"
  resource_group_name       = var.resource_group_name
  location                  = var.location
  private_endpoint_variable = var.private_endpoint_variable
  depends_on                = [module.rg_module, module.vnet_module, module.subnet_module, module.database_server_module]
}

########################## Storage Account ########################
module "storage_account_module" {
  source                   = "./modules/Storage_Account"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  storage_account_variable = var.storage_account_variable
  depends_on               = [module.rg_module]
}
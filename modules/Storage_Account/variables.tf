variable "storage_account_variable" {
  type = map(object({
    subnet_name              = string
    vnet_name                = string
    name                     = string
    account_tier             = string
    account_replication_type = string
  }))
}

variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
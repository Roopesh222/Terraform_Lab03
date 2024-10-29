variable "nsg_association_variable" {
  type = map(object({
    nsg_name    = string
    vnet_name   = string
    subnet_name = string
  }))
}

variable "resource_group_name" {
  type = string
}
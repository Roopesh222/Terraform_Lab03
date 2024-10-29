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

variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
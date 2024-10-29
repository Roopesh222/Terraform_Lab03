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
variable "resource_group_name" {
  type = string
}
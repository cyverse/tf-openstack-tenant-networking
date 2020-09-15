variable "username" {
  type = string
  description = "name of user"
}

variable "external_network_uuid" {
  type = string
  description = "uuid of the external network"
}

variable "tenant_cidr" {
  type = string
  description = "private cidr to use for tenant network"
  default = "10.0.0.0/24"
}

variable "port_rules" {
  type = list(object({
    name              = string
    direction         = string
    ethertype         = string
    protocol          = string
    port_range_min    = number
    port_range_max    = number
    remote_ip_prefix  = string
  }))
  description = "set of ports rules"
}

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

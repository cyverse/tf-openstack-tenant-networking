terraform {
  required_providers {
    openstack = {
      source = "terraform.cyverse.org/cyverse/openstack"
    }
  }
}

provider "openstack" {
}

resource "openstack_networking_secgroup_v2" "user_security_group" {
  name        = "${var.username}-api-sg"
  description = "Security group for ${var.username}"
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_22" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.user_security_group.id
}
resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_icmp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.user_security_group.id
}

resource "openstack_networking_network_v2" "user_network" {
  name        = "${var.username}-api-net"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "user_subnet" {
  name        = "${var.username}-api-subnet"
  network_id = openstack_networking_network_v2.user_network.id
  cidr       = var.tenant_cidr
  ip_version = 4
}

resource "openstack_networking_router_v2" "user_router" {
  name                = "${var.username}-api-router"
  admin_state_up      = true
  external_network_id = var.external_network_uuid
}

resource "openstack_networking_router_interface_v2" "user_router_interface" {
  router_id = openstack_networking_router_v2.user_router.id
  subnet_id = openstack_networking_subnet_v2.user_subnet.id
}

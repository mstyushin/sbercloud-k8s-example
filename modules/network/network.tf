locals {
  default_rules = {
    http-rule = {
      description = "Allow HTTP from anywhere",
      protocol = "tcp",
      port = 80,
      source = "0.0.0.0/0"
    },
    https-rule = {
      description = "Allow HTTPS from anywhere",
      protocol = "tcp",
      port = 443,
      source = "0.0.0.0/0"
    },
    ssh-rule = {
      description = "Allow SSH from anywhere",
      protocol = "tcp",
      port = 22,
      source = "0.0.0.0/0"
    }
  }
}

resource "sbercloud_vpc" "vpc" {
  name = var.vpc_name
  cidr = var.vpc_cidr
  tags = var.tags
}

resource "sbercloud_vpc_subnet" "subnet" {
  name       = var.subnet_name
  cidr       = var.subnet_cidr
  gateway_ip = var.subnet_gateway_ip

  primary_dns   = var.subnet_dns1
  secondary_dns = var.subnet_dns2

  vpc_id = sbercloud_vpc.vpc.id

  tags = var.tags
}


resource "sbercloud_networking_secgroup" "sg_default" {
  name        = var.default_security_group_name
  description = "Default security group"
}

resource "sbercloud_networking_secgroup_rule" "default_ingress_icmp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  description       = "Allow ICMP from anywhere"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"

  security_group_id = sbercloud_networking_secgroup.sg_default.id
}

resource "sbercloud_networking_secgroup_rule" "default_ingress" {
  for_each = local.default_rules

  direction         = "ingress"
  ethertype         = "IPv4"
  description       = each.value.description
  protocol          = each.value.protocol
  port_range_min    = each.value.port
  port_range_max    = each.value.port
  remote_ip_prefix  = each.value.source

  security_group_id = sbercloud_networking_secgroup.sg_default.id
}


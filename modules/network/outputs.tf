output "subnet_id" {
  description = "ID of the created default subnet"
  value       = sbercloud_vpc_subnet.subnet.id
}

output "subnet_id_openstack" {
  description = "The subnet (Native OpenStack API) ID of the created subnet"
  value       = sbercloud_vpc_subnet.subnet.subnet_id
}

output "vpc_id" {
  description = "ID of the created vpc"
  value       = sbercloud_vpc.vpc.id
}

output "sg_default_id" {
  description = "ID of the created default security group"
  value       = sbercloud_networking_secgroup.sg_default.id
}


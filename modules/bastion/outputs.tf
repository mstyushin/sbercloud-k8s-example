output "bastion_host_ip" {
  description = "IP address of the EIP associated with Bastion Host"
  value       = sbercloud_vpc_eip.bastion_eip.address
}


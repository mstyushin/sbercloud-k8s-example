resource "sbercloud_compute_instance" "bastion" {
  name              = var.hostname
  image_id          = var.ecs_image_id
  flavor_id         = var.ecs_flavor
  security_groups   = [var.default_security_group_name]
  availability_zone = var.vpc_az
  key_pair          = var.keypair_name
  system_disk_type  = var.ecs_system_disk_type
  system_disk_size  = var.ecs_system_disk_size
  user_data         = file("${path.module}/setup.sh")
  tags              = var.tags
  network {
    uuid = var.subnet_id
  }
}

resource "sbercloud_vpc_eip" "bastion_eip" {
  tags = var.tags
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name        = "elb-bastion-bandwidth"
    size        = var.bandwidth_size
    share_type  = "PER"
    charge_mode = var.bandwidth_charge_mode
  }
}

resource "sbercloud_compute_eip_associate" "associated_01" {
  public_ip   = sbercloud_vpc_eip.bastion_eip.address
  instance_id = sbercloud_compute_instance.bastion.id
}


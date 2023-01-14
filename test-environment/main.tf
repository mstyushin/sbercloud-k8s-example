provider "sbercloud" {
	region       = "ru-moscow-1"
	project_name = "ru-moscow-1_my-awesome-project"
}

module network {
  source                      = "../modules/network"
  subnet_name                 = var.subnet_name
  subnet_cidr                 = var.subnet_cidr
  subnet_gateway_ip           = var.subnet_gateway_ip
  subnet_dns1                 = var.subnet_dns1
  subnet_dns2                 = var.subnet_dns2
  vpc_name                    = var.vpc_name
  vpc_cidr                    = var.vpc_cidr
  default_security_group_name = var.default_security_group_name
  tags = {
    Organization = "anykeymax.ru"
    Project      = "Example k8s"
    Env          = "test"
  }
}

module bastion {
  source                      = "../modules/bastion"
  ecs_image_id                = var.ecs_image_id
  ecs_flavor                  = var.bastion_ecs_flavor
  default_security_group_name = var.default_security_group_name
  vpc_az                      = var.vpc_az1
  keypair_name                = var.keypair_name
  ecs_system_disk_type        = var.bastion_ecs_system_disk_type
  ecs_system_disk_size        = var.bastion_ecs_system_disk_size
  subnet_id                   = module.network.subnet_id

  tags = {
    Organization = "anykeymax.ru"
    Project      = "Example k8s"
    Env          = "test"
  }

  depends_on = [
    module.network
  ]
}

module cce {
  source                      = "../modules/cce"
  vpc_id                      = module.network.vpc_id
  vpc_az                      = var.vpc_az1
  subnet_id                   = module.network.subnet_id
  subnet_cidr                 = var.cce_subnet_cidr
  default_security_group_name = var.default_security_group_name
  keypair_name                = var.keypair_name
  cce_cluster_name            = var.cce_cluster_name
  cce_nodepool_name           = var.cce_nodepool_name
  cce_flavor                  = var.cce_flavor

  tags = {
    Organization = "anykeymax.ru"
    Project      = "Example k8s"
    Env          = "test"
  }

  depends_on = [
    module.network
  ]
}


resource "sbercloud_cce_cluster" "default" {
  name                   = var.cce_cluster_name
  flavor_id              = var.cce_flavor
  container_network_type = "overlay_l2"
  container_network_cidr = var.subnet_cidr
  multi_az               = false
  vpc_id                 = var.vpc_id
  subnet_id              = var.subnet_id
}

resource "sbercloud_cce_node_pool" "default" {
  cluster_id               = sbercloud_cce_cluster.default.id
  name                     = var.cce_nodepool_name
  flavor_id                = var.cce_node_flavor
  availability_zone        = var.vpc_az
  key_pair                 = var.keypair_name
  scall_enable             = true
  min_node_count           = 1
  initial_node_count       = 1
  max_node_count           = var.max_node_count
  scale_down_cooldown_time = 100
  priority                 = 1
  type                     = "vm"
  os                       = "CentOS 7.6"
  tags                     = var.tags

  root_volume {
    size       = 50
    volumetype = "SAS"
  }

  data_volumes {
    size       = 100
    volumetype = "SAS"
  }
}

resource "local_file" "kubeconfig" {
  depends_on   = [sbercloud_cce_cluster.default]
  filename     = "./kubeconfig"
  content      = sbercloud_cce_cluster.default.kube_config_raw
}


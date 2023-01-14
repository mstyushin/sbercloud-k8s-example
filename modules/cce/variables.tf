# ------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ------------------------------------------------------

variable "keypair_name" {
  description = "Name of the ssh keypair to use for connecting to ECS instances"
  type        = string
}

variable "default_security_group_name" {
  description = "Name of the Security Group that will be used as default one"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where to create new ECS"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR for CCE containers"
  type        = string
}

variable "vpc_az" {
  description = "Availability Zone name"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where to create resources"
  type        = string
}

variable "tags" {
  description = "Map of tags to assign to CCE resources"
  type        = map
}

# ------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ------------------------------------------------------

variable "cce_flavor" {
  description = "Instance flavor for k8s control plane nodes"
  type        = string
  default     = "cce.s2.small"
}

variable "cce_node_flavor" {
  description = "CCE Node tier"
  type        = string
  default     = "s6.2xlarge.2"
}

variable "cce_cluster_name" {
  description = "Name of the CCE cluster"
  type        = string
  default     = "test-cluster"
}

variable "cce_nodepool_name" {
  description = "Name of the CCE nodepool"
  type        = string
  default     = "test-nodepool"
}

variable "ecs_system_disk_size" {
  description = "Size of the system disk for new ECS"
  type        = number
  default     = 20
}

variable "ecs_system_disk_type" {
  description = "Type of the system disk on new ECS. Can be SSD or SAS"
  type        = string
  default     = "SAS"
}

variable "max_node_count" {
  description = "Maximum number of nodes in nodepool"
  type        = number
  default     = 3
}


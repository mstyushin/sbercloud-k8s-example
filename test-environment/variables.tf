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

variable "subnet_name" {
  description = "Name of the VPC subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR for the subnet"
  type        = string
}

variable "cce_subnet_cidr" {
  description = "CIDR for the CCE cluster subnet"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "subnet_gateway_ip" {
  description = "IP address of the gateway in the default subnet"
  type        = string
}

variable "subnet_dns1" {
  description = "IP address of the first DNS"
  type        = string
}

variable "subnet_dns2" {
  description = "IP address of the second DNS"
  type        = string
}

variable "vpc_az1" {
  description = "First availability zone name"
  type        = string
}

variable "cce_cluster_name" {
  description = "Name of the CCE cluster"
  type        = string
}

variable "cce_nodepool_name" {
  description = "Name of the CCE nodepool"
  type        = string
}

variable "cce_flavor" {
  description = "Instance flavor for k8s control plane nodes"
  type        = string
}

# ------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ------------------------------------------------------

variable "ecs_image_id" {
  description = "Default value corresponds to Ubuntu Server 20.04. Used for bastion host."
  type        = string
  default     = "649a6095-b042-4a4c-bb37-f4670cb472a3"
}

variable "bastion_ecs_flavor" {
  description = "Elastic Cloud Server tier for bastion host"
  type        = string
  default     = "s6.large.2"
}

variable "bastion_ecs_system_disk_size" {
  description = "Size of system disk for bastion host in GB"
  type        = number
  default     = 20
}

variable "bastion_ecs_system_disk_type" {
  description = "Type of the system disk on bastion host. Can be SSD or SAS"
  type        = string
  default     = "SAS"
}


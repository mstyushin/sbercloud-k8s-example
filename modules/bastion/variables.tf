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

variable "vpc_az" {
  description = "Availability Zone name"
  type        = string
}

variable "tags" {
  description = "Map of tags to assign to an ECS resources"
  type        = map
}

# ------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ------------------------------------------------------

variable "ecs_image_id" {
  description = "Default value corresponds to Ubuntu Server 20.04"
  type        = string
  default     = "649a6095-b042-4a4c-bb37-f4670cb472a3"
}

variable "ecs_flavor" {
  description = "Elastic Cloud Server tier"
  type        = string
  default     = "s6.medium.2"
}

variable "ecs_system_disk_size" {
  description = "Size of the system disk for new ECS"
  type        = number
  default     = 10
}

variable "ecs_system_disk_type" {
  description = "Type of the system disk on new ECS. Can be SSD or SAS"
  type        = string
  default     = "SAS"
}

variable "hostname" {
  description = "Hostname of the created ECS"
  type        = string
  default     = "test-bastion"
}

variable "bandwidth_size" {
  description = "Bandwidth size for created EIP"
  type        = number
  default     = 5
}

variable "bandwidth_charge_mode" {
  description = "Bandwidth charge mode for created EIP"
  type        = string
  default     = "traffic"
}

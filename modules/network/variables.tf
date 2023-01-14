# ------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ------------------------------------------------------

variable "subnet_name" {
  description = "Name of the VPC subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR for the subnet"
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

variable "vpc_cidr" {
  description = "CIDR for the new VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC to create"
  type        = string
}

variable "tags" {
  description = "Map of tags to assign to network resources"
  type        = map
}

variable "default_security_group_name" {
  description = "Name of the Security Group that will be used as default one"
  type        = string
}


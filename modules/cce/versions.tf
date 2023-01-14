terraform {
  required_providers {
    sbercloud = {
      source = "sbercloud-terraform/sbercloud"
      version = "1.10.0"
    }
    local = {
      source = "hashicorp/local"
      version = "2.2.2"
    }
  }
  required_version = ">= 1.1.8"
}


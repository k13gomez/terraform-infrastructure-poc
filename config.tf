variable "env" {
  type = string
}

variable "env_profile" {
  type = string
}

variable "env_region" {
  type = string
}

variable "stack_name" {
  type = string
}

variable "private_cidr" {
  type = string
}

provider "aws" {
  profile = var.env_profile
  region  = var.env_region
}

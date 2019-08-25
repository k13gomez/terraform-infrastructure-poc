variable "env_profile" {
  type = string
}

variable "env_region" {
  type = string
}

provider "aws" {
  profile = var.env_profile
  region  = var.env_region
}

variable "aws_profile" {
  type    = string
  default = "default"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "network_name" {
  type    = string
  default = "lambda-dev"
}

variable "network_cidr" {
  type    = string
  default = "10.20.0.0/16"
}

variable "network_az" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_cidr" {
  type    = list(string)
  default = ["10.20.0.0/22", "10.20.4.0/22", "10.20.8.0/22"]
}

variable "public_cidr" {
  type    = list(string)
  default = ["10.20.12.0/22", "10.20.16.0/22", "10.20.20.0/22"]
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

resource "aws_vpc" "network_vpc" {
  cidr_block = "${var.network_cidr}"

  tags = {
    Name = "${var.network_name}-vpc"
  }
}

resource "aws_vpc_dhcp_options" "dhcp_options" {
  domain_name_servers = ["AmazonProvidedDNS"]
  domain_name         = "ec2.internal"

  tags = {
    Name = "${var.network_name}-dhcp-options"
  }
}

resource "aws_vpc_dhcp_options_association" "network-vpc-dhcp-options" {
  vpc_id          = "${aws_vpc.network_vpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.dhcp_options.id}"
}

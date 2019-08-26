terraform {
  backend "s3" {
    bucket         = "terraform-infrastructure-k13"
    dynamodb_table = "terraform-infrastructure-k13"
    key            = "network/terraform.tfstate"
    region         = "us-east-1"
  }
}

provider "aws" {
  profile = var.env_profile
  region  = var.env_region
}

resource "aws_vpc" "network_vpc" {
  cidr_block = "${var.network_vpc_cidr}"

  tags = {
    Name = "${var.stack_name}-vpc"
  }
}

resource "aws_vpc_dhcp_options" "dhcp_options" {
  domain_name_servers = ["AmazonProvidedDNS"]
  domain_name         = "ec2.internal"

  tags = {
    Name = "${var.stack_name}-dhcp-options"
  }
}

resource "aws_vpc_dhcp_options_association" "network-vpc-dhcp-options" {
  vpc_id          = "${aws_vpc.network_vpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.dhcp_options.id}"
}

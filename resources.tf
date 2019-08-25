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

variable "private_network_cidr_base" {
  type = string
}

variable "public_network_cidr_base" {
  type = string
}

provider "aws" {
  profile = var.env_profile
  region  = var.env_region
}

resource "aws_vpc" "private" {
  cidr_block = "${var.private_network_cidr_base}.0.0/16"

  tags = {
    Name = "${var.stack_name}-private-vpc-${var.env}"
  }
}

resource "aws_security_group" "private-sg" {
  vpc_id      = "${aws_vpc.private.id}"
  name        = "${var.stack_name}-private-sg-${var.env}"
  description = "${var.stack_name} private security group - ${var.env}"

  tags = {
    Name = "${var.stack_name}-private-sg-${var.env}"
  }
}

resource "aws_network_acl" "private-acl" {
  vpc_id     = "${aws_vpc.private.id}"
  subnet_ids = ["${aws_subnet.private-subnet-a.id}", "${aws_subnet.private-subnet-b.id}", "${aws_subnet.private-subnet-c.id}", "${aws_subnet.private-subnet-d.id}"]

  tags = {
    Name = "${var.stack_name}-private-acl-${var.env}"
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.private.id}"
  tags = {
    Name = "${var.stack_name}-route-table-${var.env}"
  }
}

resource "aws_vpc_dhcp_options" "private" {
  domain_name_servers = ["AmazonProvidedDNS"]
  domain_name         = "ec2.internal"

  tags = {
    Name = "${var.stack_name}-private-dhcp-options-${var.env}"
  }
}

resource "aws_vpc_dhcp_options_association" "private" {
  vpc_id          = "${aws_vpc.private.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.private.id}"
}

resource "aws_subnet" "private-subnet-a" {
  vpc_id            = "${aws_vpc.private.id}"
  cidr_block        = "${var.private_network_cidr_base}.0.0/23"
  availability_zone = "${var.env_region}a"

  tags = {
    Name = "${var.stack_name}-private-subnet-a-${var.env}"
  }
}

resource "aws_subnet" "private-subnet-b" {
  vpc_id            = "${aws_vpc.private.id}"
  cidr_block        = "${var.private_network_cidr_base}.2.0/23"
  availability_zone = "${var.env_region}b"

  tags = {
    Name = "${var.stack_name}-private-subnet-b-${var.env}"
  }
}

resource "aws_subnet" "private-subnet-c" {
  vpc_id            = "${aws_vpc.private.id}"
  cidr_block        = "${var.private_network_cidr_base}.4.0/23"
  availability_zone = "${var.env_region}c"

  tags = {
    Name = "${var.stack_name}-private-subnet-c-${var.env}"
  }
}

resource "aws_subnet" "private-subnet-d" {
  vpc_id            = "${aws_vpc.private.id}"
  cidr_block        = "${var.private_network_cidr_base}.6.0/23"
  availability_zone = "${var.env_region}d"

  tags = {
    Name = "${var.stack_name}-private-subnet-d-${var.env}"
  }
}

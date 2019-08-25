resource "aws_vpc" "stack-private" {
  cidr_block = "${var.private_network_cidr_base}.0.0/16"

  tags = {
    Name = "${var.stack_name}-private-vpc-${var.env}"
  }
}

resource "aws_vpc_dhcp_options" "stack-private" {
  domain_name_servers = ["AmazonProvidedDNS"]
  domain_name         = "ec2.internal"

  tags = {
    Name = "${var.stack_name}-private-dhcp-options-${var.env}"
  }
}

resource "aws_vpc_dhcp_options_association" "stack-private" {
  vpc_id          = "${aws_vpc.stack-private.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.stack-private.id}"
}

resource "aws_subnet" "stack-private-subnet-a" {
  vpc_id            = "${aws_vpc.stack-private.id}"
  cidr_block        = "${var.private_network_cidr_base}.0.0/23"
  availability_zone = "${var.env_region}a"

  tags = {
    Name = "${var.stack_name}-private-subnet-a-${var.env}"
  }
}

resource "aws_subnet" "stack-private-subnet-b" {
  vpc_id            = "${aws_vpc.stack-private.id}"
  cidr_block        = "${var.private_network_cidr_base}.2.0/23"
  availability_zone = "${var.env_region}b"

  tags = {
    Name = "${var.stack_name}-private-subnet-b-${var.env}"
  }
}

resource "aws_subnet" "stack-private-subnet-c" {
  vpc_id            = "${aws_vpc.stack-private.id}"
  cidr_block        = "${var.private_network_cidr_base}.4.0/23"
  availability_zone = "${var.env_region}c"

  tags = {
    Name = "${var.stack_name}-private-subnet-c-${var.env}"
  }
}

resource "aws_subnet" "stack-private-subnet-d" {
  vpc_id            = "${aws_vpc.stack-private.id}"
  cidr_block        = "${var.private_network_cidr_base}.6.0/23"
  availability_zone = "${var.env_region}d"

  tags = {
    Name = "${var.stack_name}-private-subnet-d-${var.env}"
  }
}

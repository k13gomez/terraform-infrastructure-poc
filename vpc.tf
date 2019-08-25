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

resource "aws_default_network_acl" "default" {
  default_network_acl_id = "${aws_vpc.network_vpc.default_network_acl_id}"

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.network_vpc_cidr}"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}

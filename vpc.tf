resource "aws_vpc" "network_vpc" {
  cidr_block = "${var.private_network_cidr_base}.0.0/16"

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

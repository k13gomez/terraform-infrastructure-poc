resource "aws_subnet" "private_subnet_a" {
  vpc_id            = "${aws_vpc.network_vpc.id}"
  cidr_block        = "${var.private_network_cidr_base}.0.0/23"
  availability_zone = "${var.env_region}a"

  tags = {
    Name = "${var.stack_name}-private-subnet-a"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id            = "${aws_vpc.network_vpc.id}"
  cidr_block        = "${var.private_network_cidr_base}.2.0/23"
  availability_zone = "${var.env_region}b"

  tags = {
    Name = "${var.stack_name}-private-subnet-b"
  }
}

resource "aws_subnet" "private_subnet_c" {
  vpc_id            = "${aws_vpc.network_vpc.id}"
  cidr_block        = "${var.private_network_cidr_base}.4.0/23"
  availability_zone = "${var.env_region}c"

  tags = {
    Name = "${var.stack_name}-private-subnet-c"
  }
}

resource "aws_subnet" "private_subnet_d" {
  vpc_id            = "${aws_vpc.network_vpc.id}"
  cidr_block        = "${var.private_network_cidr_base}.6.0/23"
  availability_zone = "${var.env_region}d"

  tags = {
    Name = "${var.stack_name}-private-subnet-d"
  }
}

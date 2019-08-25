resource "aws_subnet" "private_subnet_a" {
  vpc_id            = "${aws_vpc.network_vpc.id}"
  cidr_block        = "${var.private_subnet_a_cidr}"
  availability_zone = "${var.env_region}a"

  tags = {
    Name = "${var.stack_name}-private-subnet-a"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id            = "${aws_vpc.network_vpc.id}"
  cidr_block        = "${var.private_subnet_b_cidr}"
  availability_zone = "${var.env_region}b"

  tags = {
    Name = "${var.stack_name}-private-subnet-b"
  }
}

resource "aws_subnet" "private_subnet_c" {
  vpc_id            = "${aws_vpc.network_vpc.id}"
  cidr_block        = "${var.private_subnet_c_cidr}"
  availability_zone = "${var.env_region}c"

  tags = {
    Name = "${var.stack_name}-private-subnet-c"
  }
}

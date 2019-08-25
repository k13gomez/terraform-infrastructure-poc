resource "aws_subnet" "public_subnet_a" {
  vpc_id            = "${aws_vpc.network_vpc.id}"
  cidr_block        = "${var.public_subnet_a_cidr}"
  availability_zone = "${var.env_region}a"

  tags = {
    Name = "${var.stack_name}-public-subnet-a"
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id            = "${aws_vpc.network_vpc.id}"
  cidr_block        = "${var.public_subnet_b_cidr}"
  availability_zone = "${var.env_region}b"

  tags = {
    Name = "${var.stack_name}-public-subnet-b"
  }
}

resource "aws_subnet" "public_subnet_c" {
  vpc_id            = "${aws_vpc.network_vpc.id}"
  cidr_block        = "${var.public_subnet_c_cidr}"
  availability_zone = "${var.env_region}c"

  tags = {
    Name = "${var.stack_name}-public-subnet-c"
  }
}

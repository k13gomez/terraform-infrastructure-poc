resource "aws_subnet" "private_subnet_a" {
  vpc_id            = "${aws_vpc.network_vpc.id}"
  cidr_block        = "${var.private_cidr[0]}"
  availability_zone = "${var.network_az[0]}"

  tags = {
    Name = "${var.network_name}-private-subnet-a"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id            = "${aws_vpc.network_vpc.id}"
  cidr_block        = "${var.private_cidr[1]}"
  availability_zone = "${var.network_az[1]}"

  tags = {
    Name = "${var.network_name}-private-subnet-b"
  }
}

resource "aws_subnet" "private_subnet_c" {
  vpc_id            = "${aws_vpc.network_vpc.id}"
  cidr_block        = "${var.private_cidr[2]}"
  availability_zone = "${var.network_az[2]}"

  tags = {
    Name = "${var.network_name}-private-subnet-c"
  }
}

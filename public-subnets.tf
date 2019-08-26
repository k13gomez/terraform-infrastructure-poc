resource "aws_subnet" "public_subnet_a" {
  vpc_id            = "${aws_vpc.network_vpc.id}"
  cidr_block        = "${var.public_cidr[0]}"
  availability_zone = "${var.network_az[0]}"

  tags = {
    Name = "${var.network_name}-public-subnet-a"
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id            = "${aws_vpc.network_vpc.id}"
  cidr_block        = "${var.public_cidr[1]}"
  availability_zone = "${var.network_az[1]}"

  tags = {
    Name = "${var.network_name}-public-subnet-b"
  }
}

resource "aws_subnet" "public_subnet_c" {
  vpc_id            = "${aws_vpc.network_vpc.id}"
  cidr_block        = "${var.public_cidr[2]}"
  availability_zone = "${var.network_az[2]}"

  tags = {
    Name = "${var.network_name}-public-subnet-c"
  }
}

resource "aws_internet_gateway" "igwy" {
  vpc_id = "${aws_vpc.network_vpc.id}"

  tags = {
    Name = "${var.network_name}-internet-gateway"
  }
}

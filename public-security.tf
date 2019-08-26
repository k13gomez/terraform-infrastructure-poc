resource "aws_security_group" "public_sg" {
  vpc_id      = "${aws_vpc.network_vpc.id}"
  name        = "${var.network_name}-public-sg"
  description = "${var.network_name} public security group"

  tags = {
    Name = "${var.network_name}-public-sg"
  }
}

resource "aws_network_acl" "public_acl" {
  vpc_id     = "${aws_vpc.network_vpc.id}"
  subnet_ids = ["${aws_subnet.public_subnet_a.id}", "${aws_subnet.public_subnet_b.id}", "${aws_subnet.public_subnet_c.id}"]

  tags = {
    Name = "${var.network_name}-public-acl"
  }
}

resource "aws_security_group" "private_sg" {
  vpc_id      = "${aws_vpc.network_vpc.id}"
  name        = "${var.stack_name}-private-sg"
  description = "${var.stack_name} private security group"

  tags = {
    Name = "${var.stack_name}-private-sg"
  }
}

resource "aws_network_acl" "private_acl" {
  vpc_id     = "${aws_vpc.network_vpc.id}"
  subnet_ids = ["${aws_subnet.private_subnet_a.id}", "${aws_subnet.private_subnet_b.id}", "${aws_subnet.private_subnet_c.id}"]

  tags = {
    Name = "${var.stack_name}-private-acl"
  }
}

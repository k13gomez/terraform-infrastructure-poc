resource "aws_vpc" "stack-private-vpc" {
  cidr_block = "${var.private_cidr}"

  tags = {
    Name = "${var.stack_name}-private-vpc-${var.env}"
  }
}

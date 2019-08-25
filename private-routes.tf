resource "aws_route_table" "private_rt" {
  vpc_id = "${aws_vpc.network_vpc.id}"

  tags = {
    Name = "${var.stack_name}-route-table"
  }
}

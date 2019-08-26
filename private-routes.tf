resource "aws_route_table" "private_rt" {
  vpc_id = "${aws_vpc.network_vpc.id}"

  tags = {
    Name = "${var.network_name}-private-route-table"
  }
}

resource "aws_route_table_association" "private_subnet_a_rt" {
  subnet_id      = "${aws_subnet.private_subnet_a.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
}

resource "aws_route_table_association" "private_subnet_b_rt" {
  subnet_id      = "${aws_subnet.private_subnet_b.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
}

resource "aws_route_table_association" "private_subnet_c_rt" {
  subnet_id      = "${aws_subnet.private_subnet_c.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
}

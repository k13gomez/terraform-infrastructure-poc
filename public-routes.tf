resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.network_vpc.id}"

  tags = {
    Name = "${var.stack_name}-public-route-table"
  }
}

resource "aws_route_table_association" "public_subnet_a_rt" {
  subnet_id      = "${aws_subnet.public_subnet_a.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

resource "aws_route_table_association" "public_subnet_b_rt" {
  subnet_id      = "${aws_subnet.public_subnet_b.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

resource "aws_route_table_association" "public_subnet_c_rt" {
  subnet_id      = "${aws_subnet.public_subnet_c.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags {
    Name      = "${var.service}-public-route"
    terraform = true
    module    = "app"
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name      = "${var.service}-private-route"
    terraform = true
    module    = "db"
  }
}

resource "aws_route_table_association" "app_1" {
  count          = "${aws_subnet.app_1.count}"
  subnet_id      = "${element(aws_subnet.app_1.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "app_2" {
  count          = "${aws_subnet.app_2.count}"
  subnet_id      = "${element(aws_subnet.app_2.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "elb" {
  count          = "${aws_subnet.public.count}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "db" {
  count          = "${var.three_tier ? aws_subnet.db.count : 0}"
  subnet_id      = "${element(aws_subnet.db.*.id, count.index)}"
  route_table_id = "${aws_route_table.private.id}"
}

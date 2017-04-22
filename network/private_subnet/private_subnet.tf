resource "aws_subnet" "private" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${element(split(",", var.cidrs), count.index)}"
  availability_zone = "${element(split(",", var.availability_zones), count.index)}"
  count = "${length(split(",",var.cidrs))}"

  tags {
    Name = "${var.name}-private-${format("%03d", count.index+1)}"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${element(split(",", var.nat_gateway_ids), count.index)}"
  }

  tags {
    Name = "${var.name}-private"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "private" {
  count = "${length(split(",", var.cidrs))}"
  subnet_id = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"

  lifecycle {
    create_before_destroy = true
  }
}

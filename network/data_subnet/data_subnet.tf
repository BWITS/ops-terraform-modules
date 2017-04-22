resource "aws_subnet" "data" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${element(split(",", var.cidrs), count.index)}"
  availability_zone = "${element(split(",", var.availability_zones), count.index)}"
  count = "${length(split(",", var.cidrs))}"

  tags {
    Name = "${var.name}-data-${format("%03d", count.index+1)}"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table" "data" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name = "${var.name}-nat"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "private" {
  count = "${length(split(",", var.cidrs))}"
  subnet_id = "${element(aws_subnet.data.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.data.*.id, count.index)}"

  lifecycle {
    create_before_destroy = true
  }
}

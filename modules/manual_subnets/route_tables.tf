resource "aws_internet_gateway" "main" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name = "${var.stack_name}-gateway"
    terraform = true
    myob_aws_account_template = true
    module = "route_tables"
  }
}

resource "aws_route_table" "ig_route" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags {
    Name = "${var.stack_name}-internet-gateway-routes"
    terraform = true
    myob_aws_account_template = true
    module = "route_tables"
  }
}

resource "aws_route_table" "no_ig_route" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name = "${var.stack_name}-non-internet-gateway-routes"
    terraform = true
    myob_aws_account_template = true
    module = "route_tables"
  }
}

resource "aws_route_table_association" "public_ig_routes" {
  count = "${length(var.public_subnets)}"
  subnet_id = "${element(aws_subnet.public_subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.ig_route.id}"
}

resource "aws_route_table_association" "app_ig_routes" {
  count = "${length(var.app_subnets)}"
  subnet_id = "${element(aws_subnet.app_subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.ig_route.id}"
}

resource "aws_route_table_association" "data_non_ig_routes" {
  count = "${length(var.data_subnets)}"
  subnet_id = "${element(aws_subnet.data_subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.no_ig_route.id}"
}

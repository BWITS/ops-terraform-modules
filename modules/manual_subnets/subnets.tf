resource "aws_subnet" "public_subnet" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${element(var.public_subnets, count.index)}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  count = "${length(var.public_subnets)}"
  map_public_ip_on_launch = true

  tags {
    Name = "${var.stack_name}-public-${element(var.app_subnets, count.index+1)}"
    terraform = true
    ops_terraform_modules = true
    type = "public"
    module = "manual_subnets"
  }
}

resource "aws_subnet" "app_subnet" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${element(var.app_subnets, count.index)}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  count = "${length(var.app_subnets)}"
  map_public_ip_on_launch = true

  tags {
    Name = "${var.stack_name}-app-${element(var.app_subnets, count.index+1)}"
    terraform = true
    ops_terraform_modules = true
    type = "app"
    module = "manual_subnets"
  }
}

resource "aws_subnet" "data_subnet" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${element(var.data_subnets, count.index)}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  count = "${length(var.data_subnets)}"

  tags {
    Name = "${var.stack_name}-data-${element(var.app_subnets, count.index+1)}"
    terraform = true
    ops_terraform_modules = true
    type = "data"
    module = "manual_subnets"
  }
}

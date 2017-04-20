data "aws_availability_zones" "available" {
}

resource "aws_subnet" "public_subnet" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id = "${var.vpc_id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr, 4, count.index)}"
  availability_zone = "${element(data.aws_availability_zones.available.names,count.index)}"

  tags {
    Name = "${var.stack_name}-public-${element(data.aws_availability_zones.available.names,count.index)}"
    terraform = true
    ops_terraform_modules = true
    type = "public"
    module = "auto_subnets"
  }
}

resource "aws_subnet" "app_subnet" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id = "${var.vpc_id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr, 4, count.index + 5)}"
  availability_zone = "${element(data.aws_availability_zones.available.names,count.index)}"

  tags {
    Name = "${var.stack_name}-app-${element(data.aws_availability_zones.available.names,count.index)}"
    terraform = true
    ops_terraform_modules = true
    type = "app"
    module = "auto_subnets"
  }
}

resource "aws_subnet" "data_subnet" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id = "${var.vpc_id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr, 4, count.index + 10)}"
  availability_zone = "${element(data.aws_availability_zones.available.names,count.index)}"

  tags {
    Name = "${var.stack_name}-data-${element(data.aws_availability_zones.available.names,count.index)}"
    terraform = true
    ops_terraform_modules = true
    type = "data"
    module = "auto_subnets"
  }
}
data "aws_vpc" "available" {
  id = "${var.vpc_id}"
}

module "app_nat" {
  source = "./nat"
  name = "${var.name}"
  subnet_ids = "${module.app_subnet.subnet_ids}"
}

module "public_subnet" {
  source = "./public_subnet"
  name = "${var.name}"
  vpc_id = "${var.vpc_id}"
  cidrs = "10.0.0.0/24,10.0.1.0/24,10.0.2.0/24"
}

module "app_subnet" {
  source = "./private_subnet"
  name = "${var.name}-app"
  vpc_id = "${var.vpc_id}"
  cidrs = "10.0.10.0/24,10.0.11.0/24,10.0.12.0/24"
  nat_gateway_ids = "${module.app_nat.nat_gateway_ids}"
}

module "data_subnet" {
  source = "./data_subnet"
  name = "${var.name}-data"
  vpc_id = "${var.vpc_id}"
  cidrs = "10.0.20.0/24,10.0.21.0/24,10.0.22.0/24"
}

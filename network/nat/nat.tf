resource "aws_eip" "nat" {
  vpc = true
  count = "${length(split(",", var.availability_zones))}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id = "${element(split(",", var.subnet_ids), count.index)}"
  count = "${length(split(",", var.availability_zones))}"

  lifecycle {
    create_before_destroy = true
  }
}

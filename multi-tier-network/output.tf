output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "internet_gateway_id" {
  value = "${aws_internet_gateway.main.id}"
}

output "app_1_subnet_ids" {
  value = ["${aws_subnet.app_1.*.id}"]
}

output "app_2_subnet_ids" {
  value = ["${aws_subnet.app_2.*.id}"]
}

output "public_subnet_ids" {
  value = ["${aws_subnet.public.*.id}"]
}

output "db_subnet_ids" {
  value = ["${aws_subnet.db.*.id}"]
}

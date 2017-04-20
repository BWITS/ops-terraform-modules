// A list of the created subnet ids.
output "public_subnet_ids" {
  value = [
    "${aws_subnet.public_subnet.*.id}"]
}

output "public_subnet_cidrs" {
  value = [
    "${aws_subnet.public_subnet.*.cidr_block}"]
}

output "app_subnet_ids" {
  value = [
    "${aws_subnet.app_subnet.*.id}"]
}

output "app_subnet_cidrs" {
  value = [
    "${aws_subnet.app_subnet.*.cidr_block}"]
}

output "data_subnet_ids" {
  value = [
    "${aws_subnet.data_subnet.*.id}"]
}

output "data_subnet_cidrs" {
  value = [
    "${aws_subnet.data_subnet.*.cidr_block}"]
}
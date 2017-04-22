output "subnet_ids" {
  value = "${join(",", aws_subnet.data.*.id)}"
}

variable "name" {
  default = "private"
}
variable "vpc_id" {
}
variable "cidrs" {
  type = "list"
}
variable "availability_zones" {
  type = "list"
}
variable "nat_gateway_ids" {
  type = "list"
}
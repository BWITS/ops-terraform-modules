variable "name" {
  default = "private"
}
variable "vpc_id" {
}
variable "cidrs" {
  type = "string"
}
variable "availability_zones" {
  type = "string"
}
variable "nat_gateway_ids" {
}
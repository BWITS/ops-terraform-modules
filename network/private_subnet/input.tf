variable "name" {
  default = "private"
}
variable "vpc_id" {
}
variable "cidrs" {
  type = "string"
  default = "10.0.10.0/24,10.0.11.0/24,10.0.12.0/24"
}
variable "availability_zones" {
  type = "string"
  default = "ap-southeast-2a,ap-southeast-2b,ap-southeast-2c"
}
variable "nat_gateway_ids" {
}
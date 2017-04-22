variable "name" {
  default = "nat"
}
variable "availability_zones" {
  type = "string"
  default = "ap-southeast-2a,ap-southeast-2b,ap-southeast-2c"
}
variable "subnet_ids" {
}
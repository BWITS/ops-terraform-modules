variable "name" {
  type = "string"
  default = "public"
}
variable "vpc_id" {
  type = "string"
}
variable "cidrs" {
  type = "string"
  default = "10.0.1.0/24,10.0.2.0/24,10.0.3.0/24"
}
variable "availability_zones" {
  type = "string"
  default = "ap-southeast-2a,ap-southeast-2b,ap-southeast-2c"
}
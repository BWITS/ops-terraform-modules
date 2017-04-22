variable "name" {
  type = "string"
  default = "public"
}
variable "vpc_id" {
  type = "string"
}
variable "cidrs" {
  type = "string"
}
variable "availability_zones" {
  type = "string"
}
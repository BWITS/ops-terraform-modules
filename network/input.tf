variable "name" {
  type = "string"
  description = "The name of the stack for the VPC will be associated"
}
variable "vpc_id" {
  type = "string"
}
variable "availability_zones" {
  type = "string"
}
variable "public_cidrs" {
  type = "string"
}
variable "app_cidrs" {
  type = "string"
}
variable "data_cidrs" {
  type = "string"
}
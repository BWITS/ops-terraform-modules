variable "stack_name" {
  type = "string"
  description = "The name of the stack for the VPC will be associated"
}

variable "vpc_id" {
  type = "string"
  description = "The ID of the VPC the subnets will be created in"
}

variable "vpc_cidr" {
  type = "string"
  description = "The CIDR block of the VPC the subnets will be created in"
}
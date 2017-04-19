variable "stack_name" {
  type        = "string"
  description = "The name of the stack for the VPC will be associated"
}

variable "vpc_cidr" {
  type    = "string"
  default = "192.168.0.0/20"
}

variable "vpc_flow_log_traffic_type" {
  type    = "string"
  default = "REJECT"
}

variable "vpc_flow_log_retention" {
  type    = "string"
  default = "14"
}

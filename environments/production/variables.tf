variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "vpc_cidr" {
  type    = string
  default = "10.2.0.0/16"
}
variable "instance_count" {
  type    = number
  default = 4
}
variable "ami_id" {
  type    = string
  default = "ami-04144e1d88f3aa3a0"
}
variable "instance_type" {
  type    = string
  default = "t4g.small"
}


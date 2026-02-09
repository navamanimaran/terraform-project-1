variable "aws_region" {
  type    = string
  default = "us-west-1"
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
  default = "ami-0c7217cdde317cfec"
}
variable "instance_type" {
  type    = string
  default = "t2.large"
}

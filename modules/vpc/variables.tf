variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}
variable "subnet_cidr" {
  type        = string
  description = "CIDR block for the subnet"
}
variable "availability_zone" {
  type        = string
  description = "Availability zone for the subnet"
  default     = "us-east-1a"
}
variable "environment" {
  type        = string
  description = "Environment name"
}

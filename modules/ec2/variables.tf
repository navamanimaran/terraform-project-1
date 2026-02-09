variable "instance_count" {
  type        = number
  description = "Number of instances to create"
}
variable "ami_id" {
  type        = string
  description = "AMI ID for the instance"
}
variable "instance_type" {
  type        = string
  description = "Instance type"
}
variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}
variable "security_group_id" {
  type        = string
  description = "Security group ID"
}
variable "environment" {
  type        = string
  description = "Environment name"
}

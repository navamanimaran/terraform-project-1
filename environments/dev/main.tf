terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
  backend "s3" {}
}
provider "aws" {
  region = var.aws_region
}
resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http_prod"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = module.vpc.vpc_id
  ingress {
    description = "Allow SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
module "vpc" {
  source            = "../../modules/vpc"
  vpc_cidr          = var.vpc_cidr
  subnet_cidr       = cidrsubnet(var.vpc_cidr, 8, 1)
  availability_zone = "${var.aws_region}a"
  environment       = production
}
module "ec2" {
  source            = "../../modules/ec2"
  instance_count    = var.instance_count
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.vpc.subnet_id
  security_group_id = aws_security_group.allow_ssh_http.id
  environment       = production
}

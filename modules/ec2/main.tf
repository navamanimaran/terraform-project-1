resource "aws_instance" "appserver" {
  count                  = var.instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  tags = {
    Name        = "${var.environment}-instance-${count.index}"
    environment = var.environment
    managed_by  = "terraform"
    cost_center = "engineering"
  }
}

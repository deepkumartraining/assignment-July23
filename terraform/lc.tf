# Launch configuration for web instances
resource "aws_launch_configuration" "web_lc" {
  name_prefix          = "web-lc-"
  image_id             = var.web_ami_id
  instance_type        = var.instance_type
  security_groups      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}

# Launch configuration for app instances
resource "aws_launch_configuration" "app_lc" {
  name_prefix          = "app-lc-"
  image_id             = var.app_ami_id
  instance_type        = var.instance_type
  security_groups      = [aws_security_group.app_sg.id]
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}
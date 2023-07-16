# Create an application load balancer
resource "aws_lb" "my_alb" {
  name               = "alb"
  internal           = var.is_internal
  load_balancer_type = "application"
  #security_groups    = var.security_groups
  #subnets            = var.subnets
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  security_groups    = [aws_security_group.web-alb-sg]
  enable_deletion_protection = false
  tags = var.tags_alb
}

# Create target group for the web servers
resource "aws_lb_target_group" "web_target_group" {
  name     = "web-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}

# Attach target group to the ALB listener
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_target_group.arn
  }
}

# Launch configuration for web server instances
resource "aws_launch_configuration" "web_lc" {
  name                 = "web-lc"
  image_id             = "ami-0f11bdca99c4ccd38"  # Specify the appropriate AMI ID for your web server, need to check
  instance_type        = "t2.micro"
  security_groups      = [aws_security_group.web_server_sg.id]
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}

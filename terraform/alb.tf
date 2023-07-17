# Create Application Load Balancer (ALB)
resource "aws_lb" "alb" {
  name               = "alb"
  load_balancer_type = "application"
  subnets            = aws_subnet.public_subnet[*].id
  security_groups    = [aws_security_group.alb_sg.id]

  enable_deletion_protection = true

  access_logs {
    bucket = "alb-logs"
  }

  tags = {
    Name = "alb"
  }
}

# Create ALB security group
resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Security group for ALB"
  vpc_id      = aws_vpc.vpc.id

  # Ingress rule for HTTP traffic from any source
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule allowing all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# internal lb
resource "aws_lb" "ilb" {
  name               = "ilb"
  internal           = true
  load_balancer_type = "network"
  subnets            = aws_subnet.private_subnet[*].id
}

resource "aws_lb_target_group" "web_tg" {
  name     = "web-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  tags = {
    Name        = "web-target-group"
    Environment = "practice"
  }

}

resource "aws_lb_target_group" "app_tg" {
  name     = "app-target-group"
  port     = 8080
  protocol = "TCP"
  vpc_id   = aws_vpc.vpc.id
  tags = {
    Name        = "app-target-group"
    Environment = "practice"
  }

}

resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.ilb.arn
  port              = 8080
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.app_tg.arn
    type             = "forward"
  }
}

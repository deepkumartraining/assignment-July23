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
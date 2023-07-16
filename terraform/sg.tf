# Create security groups for load balancer, web server, app server and database
resource "aws_security_group" "web-alb-sg" {
  vpc_id            = aws_vpc.vpc.id
  tags              = var.tags_sg_web
  description       = var.sg_description_web
  ingress {
    description = "allow on 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = null
  }

  ingress {
    description     = "allow on 443"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    #security_groups = [aws_security_group.example_sg.id]
    security_groups = null
  }
  egress {
    description = "allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = null
  }
}
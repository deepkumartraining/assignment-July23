# Create ILB security group
resource "aws_security_group" "ilb_sg" {
  name        = "ilb-sg"
  description = "Security group for ILB"
  vpc_id      = aws_vpc.vpc.id

  # Ingress rule for HTTP traffic from the app tier security group
  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  # Egress rule allowing all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
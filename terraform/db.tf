resource "aws_security_group" "db_sg" {
  name        = "db-sg"
  description = "Security group for DB tier"
  vpc_id      = aws_vpc.vpc.id

  # Add ingress and egress rules as needed for the DB tier
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# RDS database instance
resource "aws_db_instance" "rds" {
  engine               = "mysql"
  instance_class       = "db.t2.micro"
  allocated_storage    = 20
  storage_type         = "gp2"
  username             = "admin"
  password             = "password"
  #name                 = "rds"
  parameter_group_name = "default.mysql5.7"
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  multi_az             = true

  tags = {
    Name = "database"
  }
}
# RDS database instance
resource "aws_db_instance" "rds" {
  engine               = "mysql"
  instance_class       = "db.t2.micro"
  allocated_storage    = 20
  storage_type         = "gp2"
  username             = "admin"
  password             = "password"
  name                 = "rds"
  parameter_group_name = "default.mysql5.7"
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  multi_az             = true

  tags = {
    Name = "database"
  }
}
# Create a DB subnet group for the RDS instances
resource "aws_db_subnet_group" "db_subnet_group" {
  name        = "private-db-subnet-group"
  subnet_ids  = aws_subnet.db_subnet.*.id
  description = "Subnets available for the RDS DB Instance"
}



# RDS database instance
resource "aws_db_instance" "rds_primary_instances" {
  count                   = length(aws_subnet.db_subnet) > 1 ? 1 : 0
  identifier_prefix    = "mydb-rds-primary"
  engine               = "mysql"
  instance_class       = "db.t2.micro"
  allocated_storage    = 20
  storage_type         = "gp2"
  username             = "admin"
  password             = "password"
  #name                 = "rds"
  #parameter_group_name = "default.mysql5.7"
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  multi_az             = true
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name

  tags = {
    #Name = "database"
    Name = "RDS-private-instance-${count.index + 1}"
  }
}
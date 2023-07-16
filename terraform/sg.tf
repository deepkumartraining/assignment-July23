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

# Web Server Security Group

resource "aws_security_group" "web_server-sg" {
  vpc_id = aws_vpc.vpc.id
  tags   = var.tags_sg_web_server
  description = var.sg_description_web_server
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.web-alb-sg.id]
  }
  egress {
    description     = "allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = null
  }  
}

# App server - Security Group
### This needs to configure for Web -> App -> DB layer details

resource "aws_security_group" "app-alb-sg" {
  vpc_id = aws_vpc.vpc.id
  tags   = var.tags_sg_app
  description = var.sg_description_app
  ingress {
    description     = "allow on 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = null
  }
  ingress {
    description     = "allow on 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = null
  }
  egress {
    description     = "allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = null
  }
}
# App Server Security Group
resource "aws_security_group" "app_server-sg" {
  vpc_id = aws_vpc.vpc.id
  tags = var.tags_sg_web_server
  description = var.sg_description_app_server
  ingress {
    description = "allow on 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = null
    security_groups      = [aws_security_group.app-alb-sg.id]
  }
  ingress {
    description = "allow on 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = null
    security_groups       = [aws_security_group.app-alb-sg.id]
  }
  egress {
    description     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }
}

#RDS Security Group
resource "aws_security_group" "db_sg" {
  vpc_id = aws_vpc.vpc.id
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    #security_groups = null #need to configure for security
    security_groups = [aws_security_group.web_sg.id]
    #cidr_blocks = ["10.0.3.0/24", "10.0.4.0/24"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# RDS DB Security Setup
#--Subnet Group creation
/* #Need to fix this
resource "aws_db_subnet_group" "subnet_group" {
  name       = var.rds_subnet_group
  subnet_ids = var.database_subnets
  tags = var.tags_subnet_group
}

# DB Security Group
resource "aws_security_group" "db_sg" {
  vpc_id = aws_vpc.vpc.id
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = null #need to configure for security
    cidr_blocks = ["10.0.3.0/24", "10.0.4.0/24"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
*/
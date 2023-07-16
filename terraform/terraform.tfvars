#Project region
region = "ap-south-1"
###################
#vpc
tags_vpc = {
  Name = "tf-vpc",
  Kind = "practice"
}
cidr_vpc = "10.0.0.0/16"

######################
#subnet-1-public-ap-south-1a
#vpc_id
cidr_subnet_1 = "10.0.1.0/24"
az_subnet_1   = "ap-south-1a"
public_1      = "true"
tags_subnet_1 = {
  Name = "tf-pub-ap-south-1a",
  Kind = "practice"
}

#######################
#subnet-2-public-ap-south-1b
cidr_subnet_2 = "10.0.2.0/24"
az_subnet_2   = "ap-south-1b"
public_2      = "true"
tags_subnet_2 = {
  Name = "tf-pub-ap-south-1b",
  Kind = "practice"
}

#######################
#subnet-1-private-ap-south-1a
cidr_subnet_3 = "10.0.3.0/24"
az_subnet_3   = "ap-south-1a"
public_3      = "false"
tags_subnet_3 = {
  Name = "tf-priv-ap-south-1a",
  Kind = "practice"
}

#######################
#subnet-2-private-ap-south-1b
cidr_subnet_4 = "10.0.4.0/24"
az_subnet_4   = "ap-south-1b"
public_4      = "false"
tags_subnet_4 = {
  Name = "tf-priv-ap-south-1b",
  Kind = "practice"
}

#######################
#subnet-5-private-ap-south-1a for rds
cidr_subnet_5 = "10.0.5.0/24"
az_subnet_5   = "ap-south-1a"
public_5      = "false"
tags_subnet_5 = {
  Name = "tf-priv-rds-ap-south-1a",
  Kind = "practice"
}

#subnet-6-private-ap-south-1b for rds
cidr_subnet_6 = "10.0.6.0/24"
az_subnet_6   = "ap-south-1b"
public_6      = "false"
tags_subnet_6 = {
  Name = "tf-priv-rds-ap-south-1b",
  Kind = "practice"
}
/*
#######################
#subnet-5-private-ap-south-1a for rds
module "subnet-rds-priv-1a" {
  source      = "./modules/subnet"
  vpc_id      = module.my_vpc.my_vpc_id
  cidr_subnet = "10.0.5.0/24"
  az_subnet   = "ap-south-1a"
  public      = false
  tags_subnet = {
  Name = "tf-priv-rds-ap-south-1a",
  Kind = "practice"
  }
}

#######################
#subnet-6-private-ap-south-16 for rds

module "subnet-rds-priv-1b" {
  source      = "./modules/subnet"
  vpc_id      = module.my_vpc.my_vpc_id
  cidr_subnet = "10.0.6.0/24"
  az_subnet   = "ap-south-1b"
  public      = false
  tags_subnet = {
  Name = "tf-priv-rds-ap-south-1b",
  Kind = "practice"
  }
}
*/
#######################
#igw
tags_igw = {
  Name = "tf-igw",
  Kind = "practice"
}

##############################
#route_table
rt_tags_pub = {
  Name = "tf-rt-public",
  Kind = "practice"
}
rt_cidr_block_pub = "0.0.0.0/0"

#route_table
rt_tags_priv = {
  Name = "tf-rt-private",
  Kind = "practice"
}
rt_cidr_block_priv = "0.0.0.0/0"

##############################
#eip
tags_eip = {
  Name = "tf-eip-1",
  Kind = "practice"
}

##############################
#nat
tags_nat = {
  Name = "tf-nat-1",
  Kind = "practice"
}
##############################
#sg_alb_web
sg_name_web = "web-alb-sg"
tags_sg_web = {
  Name = "tf-web-alb-sg",
  Kind = "practice"
}
ingress_rules_web = [
  {
    description     = "allow on 443"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  },
  {
    description     = "allow on 80"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }
]

egress_rules_web = [
  {
    description     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }
]
sg_description_web = " SG for WEB ALB"

##############################
#sg_alb_web
sg_name_app = "app-alb-sg"
tags_sg_app = {
  Name = "tf-app-alb-sg",
  Kind = "practice"
}
ingress_rules_app = [
  {
    description     = "allow on 443"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  },
  {
    description     = "allow on 80"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }
]

egress_rules_app = [
  {
    description     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }
]
sg_description_app = " SG for APP ALB"

##############################
#sg_web_server
sg_name_web_server = "web_server-sg"
tags_sg_web_server = {
  Name = "tf-web_server-sg",
  Kind = "practice"
}
# ingress_rules_web_server = [
#   {
#     description = "allow on 443"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = null
#     security_groups       = [aws_security_group.alb-sg.id]
#   },
#   {
#     description = "allow on 80"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = null
#     security_groups       = [aws_security_group.alb-sg.id]
#   }
# ]

egress_rules_web_server = [
  {
    description     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }
]
sg_description_web_server = " SG for web_server"

##############################
#sg_app_server
sg_name_app_server = "app_server-sg"
tags_sg_app_server = {
  Name = "tf-app_server-sg",
  Kind = "practice"
}
# ingress_rules_app_server = [
#   {
#     description = "allow on 443"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = null
#     security_groups       = [aws_security_group.alb-sg.id]
#   },
#   {
#     description = "allow on 80"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = null
#     security_groups       = [aws_security_group.alb-sg.id]
#   }
# ]

egress_rules_app_server = [
  {
    description     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }
]
sg_description_app_server = " SG for app_server"


##############################
#web alb
tags_alb_web = {
  Name = "tf-webtier-alb",
  Kind = "practice"
}

#app alb
tags_alb_app = {
  Name = "tf-apptier-alb",
  Kind = "practice"
}

##############################
#target group

tags_web_tg = {
  Name = "tf-webtier-tg",
  Kind = "practice"
}

tags_app_tg = {
  Name = "tf-apptier-tg",
  Kind = "practice"
}
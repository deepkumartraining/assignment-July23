/*#public subnet
resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_subnet
  availability_zone       = var.az_subnet
  map_public_ip_on_launch = var.public
  tags                    = var.tags_subnet
}

#------------------

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


#-----------------------------
*/

#Public Subnet 1

resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
  tags                    = var.tags_subnet_1
}

resource "aws_route_table" "public_route_table1" {
  vpc_id        = aws_vpc.vpc.id
  rt_tags       = var.rt_tags_pub
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_route_table1.id
}

# Public subnet 2

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1b"
  tags                    = var.tags_subnet2
}

resource "aws_route_table" "public_route_table2" {
  vpc_id        = aws_vpc.vpc.id
  rt_tags       = var.rt_tags_pub
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_route_table2.id
}


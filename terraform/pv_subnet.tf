#Private Subnet 1

resource "aws_subnet" "private_subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "ap-south-1a"
  tags                    = var.tags_subnet_3
}

resource "aws_route_table" "private_route_table" {
  vpc_id        = aws_vpc.vpc.id
  tags          = var.rt_tags_priv
}

resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_route_table.id
}

/*
resource "aws_route_table" "private_route_table" {
  vpc_id        = aws_vpc.vpc.id
#  rt_tags       = var.rt_tags_priv
  tags {
    Name = "tf-rt-private"
  }
}

resource "aws_route" "private_route1" {
  route_table_id         = aws_route_table.private_route_table1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "private_subnet_association1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_route_table1.id
}

*/
# Private subnet 2

resource "aws_subnet" "private_subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "ap-south-1b"
  tags                    = var.tags_subnet_4
}

resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_route_table.id
}

/*
resource "aws_route_table" "private_route_table2" {
  vpc_id        = aws_vpc.vpc.id
  #rt_tags       = var.rt_tags_priv
    tags {
    Name = "tf-rt-private"
  }
}
/*
resource "aws_route" "private_route2" {
  route_table_id         = aws_route_table.private_route_table2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}
*/
/*
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_route_table2.id
}

*/

# Private Subnet - RDS

resource "aws_subnet" "private_subnet3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.5.0/24"
  availability_zone       = "ap-south-1a"
  tags                    = var.tags_subnet_5  
}

resource "aws_route_table_association" "private_subnet_3_association" {
  subnet_id      = aws_subnet.private_subnet3.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_subnet" "private_subnet4" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.6.0/24"
  availability_zone       = "ap-south-1b"
  tags                    = var.tags_subnet_6  
}

resource "aws_route_table_association" "private_subnet_4_association" {
  subnet_id      = aws_subnet.private_subnet4.id
  route_table_id = aws_route_table.private_route_table.id
}


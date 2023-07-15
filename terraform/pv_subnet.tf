#Private Subnet 1

resource "aws_subnet" "private_subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "ap-south-1a"
  tags                    = var.tags_subnet_3
}

resource "aws_route_table" "private_route_table" {
  vpc_id        = aws_vpc.vpc.id
  rt_tags       = var.rt_tags_priv
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

# Private subnet 2

resource "aws_subnet" "private_subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "ap-south-1b"
  tags                    = var.tags_subnet4
}

resource "aws_route_table" "private_route_table2" {
  vpc_id        = aws_vpc.vpc.id
  rt_tags       = var.rt_tags_priv
}

resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_route_table2.id
}


/*resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_internet_gateway.gw.id
}
*/
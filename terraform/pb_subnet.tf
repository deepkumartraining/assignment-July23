# Public Subnet 1

resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
  tags                    = var.tags_subnet_1
  #tags                    = "tf-pub-ap-south-1a"
  }

resource "aws_route_table" "public_route_table" {
  vpc_id        = aws_vpc.vpc.id
  tags          = var.rt_tags_pub
  #tags          = "tf-rt-public"
}

resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}


/*
resource "aws_route" "public_route1" {
  route_table_id         = aws_route_table.public_route_table1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_internet_gateway.gw.id
}


*/
# Public subnet 2

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1b"
  tags                    = var.tags_subnet2
  #tags                    = "tf-pub-ap-south-1b"
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}


/*
resource "aws_route_table" "public_route_table2" {
  vpc_id        = aws_vpc.vpc.id
#  rt_tags       = var.rt_tags_pub
  tags          = "tf-rt-public"
}

resource "aws_route" "public_route2" {
  route_table_id         = aws_route_table.public_route_table2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "public_subnet_association2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_route_table2.id
}

*/
# Create route table for public subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
}

# Associate public subnets with the public route table
resource "aws_route_table_association" "public_subnet_association" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}
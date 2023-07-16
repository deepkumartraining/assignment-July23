resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.vpc.id
  tags = var.tags_igw
}

# Attach internet gateway to the VPC
resource "aws_vpc_attachment" "igw_attach" {
  vpc_id             = aws_vpc.vpc.id
  internet_gateway_id = aws_internet_gateway.my_igw.id
}
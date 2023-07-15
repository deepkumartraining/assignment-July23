resource "aws_nat_gateway" "my_nat" {
  allocation_id = aws_eip.eip_id
  subnet_id     =  aws_subnet.my_public_subnet1.id
  depends_on    = ["aws_internet_gateway.gw"]
  tags = var.tags_nat
  
}
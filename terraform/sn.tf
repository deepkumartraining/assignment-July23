# Create public and private subnets in multiple availability zones
resource "aws_subnet" "public_subnet" {
  count             = var.subnet_count
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 8, count.index)
  availability_zone = element(var.availability_zones, count.index)
}

resource "aws_subnet" "private_subnet" {
  count             = var.subnet_count
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 8, count.index + 8)
  availability_zone = element(var.availability_zones, count.index)
}
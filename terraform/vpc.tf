resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = var.tags_vpc 
}

output "my_vpc_id" {
    value = aws_vpc.vpc.id
}
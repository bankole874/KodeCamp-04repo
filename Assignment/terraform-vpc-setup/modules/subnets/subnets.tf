variable "vpc_id" {
  type = string
}

resource "aws_subnet" "publicSubnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_subnet" "privateSubnet" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "PrivateSubnet"
  }
}

output "public_subnet_id" {
  value = aws_subnet.publicSubnet.id
}

output "private_subnet_id" {
  value = aws_subnet.privateSubnet.id
}

variable "public_subnet_id" {
  type = string
}

variable "private_rt_id" {
  type = string
}

variable "igw_id" {
  type = string
}

resource "aws_eip" "nat_elastic_ip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_elastic_ip.id
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "nat-gateway"
  }

  depends_on = [var.igw_id]
}

resource "aws_route" "private_route" {
  route_table_id         = var.private_rt_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}

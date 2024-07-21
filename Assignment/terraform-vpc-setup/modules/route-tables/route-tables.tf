variable "vpc_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

variable "igw_id" {
  type = string
}

resource "aws_route_table" "PublicRouteTable" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.PublicRouteTable.id
}

resource "aws_route_table" "PrivateRouteTable" {
  vpc_id = var.vpc_id

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.PrivateRouteTable.id
}

output "private_rt_id" {
  value = aws_route_table.PrivateRouteTable.id
}

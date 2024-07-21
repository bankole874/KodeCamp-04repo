variable "vpc_id" {
  type = string
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = var.vpc_id

  tags = {
    Name = "internet-gateway"
  }
}

output "igw_id" {
  value = aws_internet_gateway.IGW.id
}

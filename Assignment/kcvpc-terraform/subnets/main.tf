resource "aws_subnet" "public" {
  vpc_id     = var.vpc_id
  cidr_block = var.public_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.name}-public"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = var.vpc_id
  cidr_block = var.private_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.name}-private"
  }
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

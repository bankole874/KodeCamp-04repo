variable "vpc_id" {
  type = string
}

resource "aws_security_group" "publicSG" {
  name        = "publicSG"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "public-security-group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "a" {
  security_group_id = aws_security_group.publicSG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "b" {
  security_group_id = aws_security_group.publicSG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "c" {
  security_group_id = aws_security_group.publicSG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "a" {
  security_group_id = aws_security_group.publicSG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_security_group" "privateSG" {
  vpc_id = var.vpc_id

  tags = {
    Name = "private-security-group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "d" {
  security_group_id = aws_security_group.privateSG.id
  cidr_ipv4         = "10.0.1.0/24"
  from_port         = 5432
  ip_protocol       = "tcp"
  to_port           = 5432
}

resource "aws_vpc_security_group_egress_rule" "b" {
  security_group_id = aws_security_group.privateSG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

output "public_sg_id" {
  value = aws_security_group.publicSG.id
}

output "private_sg_id" {
  value = aws_security_group.privateSG.id
}

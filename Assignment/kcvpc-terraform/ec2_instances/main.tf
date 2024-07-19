resource "aws_instance" "public" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  security_groups = [var.public_security_group]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              EOF

  tags = {
    Name = "${var.name}-public-instance"
  }
}

resource "aws_instance" "private" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  security_groups = [var.private_security_group]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install postgresql postgresql-contrib -y
              EOF

  tags = {
    Name = "${var.name}-private-instance"
  }
}

output "public_instance_id" {
  value = aws_instance.public.id
}

output "private_instance_id" {
  value = aws_instance.private.id
}

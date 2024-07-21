variable "public_subnet_id" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

variable "public_sg_id" {
  type = string
}

variable "private_sg_id" {
  type = string
}

resource "aws_instance" "Public_Instance" {
  ami                         = "ami-0fb83b36371e7dab5"
  instance_type               = "t3.micro"
  subnet_id                   = var.public_subnet_id
  security_groups             = [var.public_sg_id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1.12 -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "Public-Instance"
  }
}

resource "aws_instance" "Private_Instance" {
  ami                         = "ami-0fb83b36371e7dab5"
  instance_type               = "t3.micro"
  subnet_id                   = var.private_subnet_id
  security_groups             = [var.private_sg_id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install postgresql10 -y
              systemctl start postgresql
              systemctl enable postgresql
              EOF

  tags = {
    Name = "Private-Instance"
  }
}

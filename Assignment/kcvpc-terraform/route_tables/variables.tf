variable "name" {
  description = "The name of the route tables"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "igw_id" {
  description = "The ID of the Internet Gateway"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the private subnet"
  type        = string
}

variable "name" {
  description = "The name of the NAT Gateway"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}

variable "private_route_table_id" {
  description = "The ID of the private route table"
  type        = string
}

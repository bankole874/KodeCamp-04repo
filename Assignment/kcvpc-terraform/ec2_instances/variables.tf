variable "name" {
  description = "The name of the EC2 instances"
  type        = string
}

variable "ami" {
  description = "The AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instances"
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

variable "public_security_group" {
  description = "The ID of the public security group"
  type        = string
}

variable "private_security_group" {
  description = "The ID of the private security group"
  type        = string
}

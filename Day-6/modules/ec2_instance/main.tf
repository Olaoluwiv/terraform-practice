provider "aws" {
    region = "us-east-1"
}

variable "ami" {
    description = "The Ami id of the instance"
    type = string
}

variable "instance_type" {
    description ="The instance type of the value"
    type = string
}

variable "security_group_ids" {
    description = "List of security group IDs to associate with the instance"
    type = list(string)
}

variable "subnet_id" {
    description = " The subnet_id of the subnet"
    type = string
}
resource "aws_instance" "example" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id
}
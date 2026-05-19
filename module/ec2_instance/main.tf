provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami                         = var.ami_value
  instance_type               = var.instance_types
  subnet_id                   = var.subnet_id
}
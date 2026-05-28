provider "aws" {
    region = "us-east-1"  
}

variable "ami" {
    description = "Value"
    type = string
}

variable "instance_type" {
    description = "value"
    type = map(string)

    default = {
        dev   = "t2.micro"
        prod  = "t2.xlarge"
        stage = "t2.medium"
    }
}
variable "security_group_ids" {
    description = "List of security group IDs"
    type = list(string)
}

variable "subnet_id" {
    description = " value"
    type = string
}

module "ec2_instance" {
    source = "./modules/ec2_instance"
    ami = var.ami
    instance_type = lookup(var.instance_type,terraform.workspace,"t2.medium")
    security_group_ids = var.security_group_ids
        subnet_id = var.subnet_id
    }



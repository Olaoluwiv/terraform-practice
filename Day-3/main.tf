provider "aws" {
    region ="us-east-1"
}
module "ec2_instance" {
    source = "./module/ec2_instance"
    instance_types = "t2.micro"
    ami_value = "ami-0236922087fa98b6e" 
    subnet_id = "subnet-07d4a6576b900bd5c"
}
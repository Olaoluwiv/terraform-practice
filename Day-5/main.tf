provider "aws" {
    region = "us-east-1" 
}
   variable "cidr_block"{
       default = "10.0.0.0/16"
   }
resource "aws_vpc" "my_vpc" {
    cidr_block =var.cidr_block
    tags = {
        Name = "my_vpc"
    }
}
resource "aws_key_pair" "void_key" {
    key_name = "void-key"
    public_key = file("~/.ssh/id_rsa.pub")
    
}
resource "aws_subnet" "sub1" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

    tags = {
        Name = "public-subnet"
    }
}

resource "aws_subnet" "sub2" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = false
    tags = {
        Name = "private-subnet"
        is_main = "false"
    }
}
resource "aws_internet_gateway" "myGw" {
    vpc_id = aws_vpc.my_vpc.id
}

resource "aws_eip" "nat_eip" {
    domain = "vpc"
}
resource "aws_nat_gateway" "myNatGW" {
    subnet_id = aws_subnet.sub1.id
    allocation_id = aws_eip.nat_eip.id
}

resource "aws_route_table" "myRT" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.myGW.id
    }
}
resource "aws_route_table" "myRT2" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.myNatGW.id
    }
}
resource "aws_route_table_association" "myRT" {
    subnet_id = aws_subnet.sub1.id
    route_table_id = aws_route_table.myRT.id
}
resource "aws_route_table_association" "myRT2" {
    subnet_id = aws_subnet.sub2.id
    route_table_id = aws_route_table.myRT2.id
}

resource "aws_security_group" "main" {
    name = "main-sg"
    description = "Allow ssh, http and flask "
    vpc_id = aws_vpc.my_vpc.id
    ingress {
        from_port =22
        to_port =22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_security_group" "main" {
    name = "main-sg"
    description = "Allow  http"
    vpc_id = aws_vpc.my_vpc.id
    ingress {
        from_port =80
        to_port =80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_instance" "web" {
    ami = "ami-0c558a05d1a4c7d8a"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.sub1.id
    key_name = aws_key_pair.void_key.key_name
    security_groups = [aws_security_group.main.id]

    connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host = aws_instance.web.public_ip
}
    provisioner "file" {
        source      = "app.py"
        destination = "/home/ubuntu/app.py"
    }
    provisioner "remote-exec" {
        inline = [
            "echo 'hello world'",
            "sudo apt update",
            "sudo apt install python3-pip -y",
            "cd /home/ubuntu",
            "pip3 install flask",
            "sudo python3 app.py &"
        ]
    }
}





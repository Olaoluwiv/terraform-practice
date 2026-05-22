provider "aws" { 
    region = "us-east-1"
  
}
resource "aws_instance" "Olaoluwa" {
    ami = "ami-0236922087fa98b6e"
    instance_type = "t2.micro"
    subnet_id = "subnet-07d4a6576b900bd5c"
}
resource "aws_s3_bucket" "olaoluwa_bucket" {
  bucket = "olaoluwa-bucket-2024"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
resource "aws_dynamodb_table" "terraform-lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
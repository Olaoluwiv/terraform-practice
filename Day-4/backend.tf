
# configure the backend to use s3 for storing the state file and dynamodb for state locking
 # terraform {
#   backend "s3" {
#     bucket         = "olaoluwa-bucket-2024"
#     key            = "olaoluwa-terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-lock"
#   }
# }
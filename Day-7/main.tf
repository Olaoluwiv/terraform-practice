provider "aws" {
    region = "us-east-1"
}
/*
variable "login_approle_role_id" {
  type = string
}

variable "login_approle_secret_id" {
  type = string
}*/

provider "vault" {
  address = "http://54.198.19.100:8200"
  skip_child_token = true
 
  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   =  "4dbc235c-b006-2ca4-8c3b-e6c30705eb84"
      secret_id = "ad3de9ee-6fc1-f4a2-5b89-7535fa50f959"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test-secret"
}
resource "aws_instance" "example" {
    ami = "ami-091138d0f0d41ff90"
    instance_type = "t2.micro"

    tags = {
      secret = data.vault_kv_secret_v2.example.data["username"]
    }

}
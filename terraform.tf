terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.28.0"
    }
  }

bucket "s3" {
bucket = "terraformstatebucket-tws"
key = "terraform.tfstate"
dynamodb_table = "terraform-state-table"
region = "ap-south-1"
 }
}


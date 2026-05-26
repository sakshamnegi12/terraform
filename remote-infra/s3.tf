resource "aws_s3_bucket" "terraformstatelock" {

    bucket = "terraformstatebucket-tws"

    tags = {
     name = " terraform_bucket"  
    }
}
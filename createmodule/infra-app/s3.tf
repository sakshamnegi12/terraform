resource "aws_s3_bucket" "s3_bucket" {

    bucket = "${var.env}-${var.bucket_name}"

    tags = {
     name = " ${var.env}-${var.bucket_name}"  
     Environment = var.env
    }
}
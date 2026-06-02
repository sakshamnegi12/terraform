resource "aws_dynamodb_table" "terraform-dynamodb-table" {
  name           = "${var.env}-${var.dynamodbtable_name}"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "${var.dynamodb_hashkey}"

  attribute {
    name = "${var.dynamodb_hashkey}"
    type = "S"
  }


  tags = {
    Name  = "${var.env}-${var.dynamodbtable_name}"
    Environment = var.env
  }
}
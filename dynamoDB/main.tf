resource "aws_dynamodb_table" "example" {
  name         = "example-table"
  billing_mode = "PAY_PER_REQUEST"  # Alternativ: "PROVISIONED"
  hash_key     = "ID"

  attribute {
    name = "ID"
    type = "S"  # S für String
  }

  tags = {
    Name = "example-dynamodb-table"
  }
}


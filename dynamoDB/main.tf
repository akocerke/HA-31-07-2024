resource "aws_dynamodb_table" "example" {
  name           = "new-example-table"  # Ändern Sie den Namen hier
  hash_key       = "id"
  read_capacity  = 1
  write_capacity = 1
  attribute {
    name = "id"
    type = "S"
  }
}

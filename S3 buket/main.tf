provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  # Optional: Tags hinzufügen (kann weggelassen werden, wenn nicht benötigt)
  tags = {
    Name = "example-bucket"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}

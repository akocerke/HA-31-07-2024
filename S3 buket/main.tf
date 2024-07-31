provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "example" {
  

  # Optional: Tags hinzufügen (kann weggelassen werden, wenn nicht benötigt)
  tags = {
    Name = "example-bucket"
  }
}



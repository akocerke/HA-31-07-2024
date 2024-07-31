# Subnet Resource
resource "aws_subnet" "main" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-central-1a"

  # Optional: Tags, etc.
}


resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  
  # Weitere Konfigurationen...
}

output "subnet_id" {
  value = aws_subnet.main.id
}

resource "aws_instance" "my_instance" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
  
  # Weitere Konfigurationen...
}

output "instance_public_ip" {
  value = aws_instance.my_instance.public_ip
}

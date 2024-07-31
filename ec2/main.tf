resource "aws_instance" "my_instance" {
  ami           = "ami-060f408ac4bbdc3cf"  # Die korrekte AMI-ID
  instance_type = "t2.micro"
  
  # Weitere Konfigurationen
}




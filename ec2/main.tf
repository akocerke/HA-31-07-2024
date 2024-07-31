resource "aws_instance" "my_instance" {
  ami           = "ami-060f408ac4bbdc3cf"  # Ihre AMI-ID hier einfügen
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id = aws_subnet.my_subnet.id

  tags = {
    Name = "my_instance"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-central-1a"

  tags = {
    Name = "my_subnet"
  }
}


resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow inbound traffic for web access"
  vpc_id      = var.vpc_id  # Stellen Sie sicher, dass vpc_id korrekt ist
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# provider "aws" {
#   region = "eu-central-1"
# }

# # VPC
# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
# }

# # Subnetz
# resource "aws_subnet" "main" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = "10.0.1.0/24" 
#   availability_zone       = "eu-central-1a"
#   map_public_ip_on_launch = true
# }

# # Sicherheitsgruppe
# resource "aws_security_group" "web_sg" {
#   name        = "web_sg"
#   description = "Security group for SSH, HTTP, and HTTPS access"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# # EC2-Instanz
# resource "aws_instance" "my_instance" {
#   ami           = "ami-01e444924a2233b07"
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.main.id

#   tags = {
#     Name = "laugenstange"
#   }

#   vpc_security_group_ids = [aws_security_group.web_sg.id]
# }

# # Ausgabe: Öffentliche IP-Adresse der Instanz
# output "instance_public_ip" {
#   value = aws_instance.my_instance.public_ip
# }

# # Ausgabe: Name der Security Group
# output "security_group_name" {
#   value = aws_security_group.web_sg.name
# }

# # Ausgabe: Sicherheitsgruppenregeln
# output "security_group_rule_arns" {
#   value = [
#     for rule in aws_security_group.web_sg.ingress : {
#       from_port   = rule.from_port
#       to_port     = rule.to_port
#       protocol    = rule.protocol
#       cidr_blocks = rule.cidr_blocks
#     }
#   ]
# }

provider "aws" {
  region = "eu-central-1"
}

# VPC-Modul
module "vpc" {
  source     = "./vpc"
  cidr_block = "10.0.0.0/16" # Beispiel für Eingabewert
}

# Subnetz-Modul
module "subnet" {
  source = "./subnet"
  vpc_id = module.vpc.vpc_id
}

# Sicherheitsgruppe-Modul
module "security_group" {
  source = "./security_group"
  vpc_id = module.vpc.vpc_id
}

# EC2-Modul
module "ec2" {
  source             = "./ec2"
  vpc_id             = module.vpc.vpc_id
  subnet_id          = module.subnet.subnet_id
  security_group_ids = [module.security_group.security_group_id]
}

# DynamoDB-Modul
module "dynamodb" {
  source = "./dynamoDB"
}

# Lambda-Modul
module "lambda" {
  source = "./lambda"
}

# S3-Bucket-Modul
module "s3_bucket" {
  source = "./S3 buket"
}

# Ausgaben
output "instance_public_ip" {
  value = module.ec2.instance_public_ip
}


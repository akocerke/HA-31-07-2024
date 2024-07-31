resource "aws_security_group" "web_sg" {
  name_prefix = "web_sg"
  
  # Weitere Konfigurationen...
}

output "security_group_id" {
  value = aws_security_group.web_sg.id
}

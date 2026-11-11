provider "aws" {
  region = "eu-south-2"
}

# 🚨 VULNERABILIDAD IaC: Exponer el puerto de MySQL a todo internet
resource "aws_security_group" "mysql_sg" {
  name        = "cajero_db_sg"
  description = "Security Group para MySQL del Cajero"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
}
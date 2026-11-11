provider "aws" {
  region = "eu-south-2"
}

resource "aws_security_group" "mysql_sg" {
  name        = "cajero_db_sg"
  description = "Security Group para MySQL del Cajero"

  ingress {
    description = "Permitir trafico MySQL solo desde la subred interna privada"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # IP privada segura en lugar de 0.0.0.0/0
  }
}
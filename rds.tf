resource "aws_db_subnet_group" "rds_private_group" {
  name       = "losenfasis-rds-private-subnet-group"
  subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]

  tags = {
    Name = "Los Enfasis RDS Private Subnet Group"
  }
}

resource "aws_db_instance" "BasedeDatos" {
  allocated_storage      = 20
  engine                 = "mysql"
  instance_class         = "db.t3.micro"
  db_name                = "Basededatos"
  username               = "Losenfasis"
  password               = var.db_password
  publicly_accessible    = false
  db_subnet_group_name   = aws_db_subnet_group.rds_private_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true

  tags = {
    Name = "LosEnfasis-DB-Privada"
  }
}

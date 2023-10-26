resource "aws_instance" "bastion" {
  ami           = "ami-0ab1a82de7ca5889c"
  instance_type = "t2.micro"
  key_name      = "dev_ops_itca"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.bastion.id]
  associate_public_ip_address = true

    provisioner "file" {
      source      = "C:/Users/Home/Downloads/key/dev_ops_itca.pem"
      destination = "/home/ec2-user/dev_ops_itca.pem"

      connection {
        type        = "ssh"
        host        = aws_instance.bastion.public_ip
        user        = "ec2-user"
        private_key = file("C:/Users/Home/Downloads/key/dev_ops_itca.pem")
        insecure    = true
      }
    }
}

resource "aws_instance" "ci_cd" {
  ami           = "ami-0ab1a82de7ca5889c"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_1.id
}

resource "aws_instance" "frontend" {
  ami           = "ami-0ab1a82de7ca5889c"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private_1.id
}

resource "aws_instance" "backend" {
  ami           = "ami-0ab1a82de7ca5889c"
  instance_type = "t3.medium"
  subnet_id     = aws_subnet.private_1.id
}

resource "aws_instance" "monitoring" {
  ami           = "ami-0ab1a82de7ca5889c"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_1.id
}

resource "aws_db_instance" "rds" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = "db.t3.large"
  db_name                 = "mydb"
  username             = "admin"
  password             = "password"
  parameter_group_name = "default.mysql8.0"


  vpc_security_group_ids = [aws_security_group.rds.id]

  db_subnet_group_name = aws_db_subnet_group.main.name

  final_snapshot_identifier = "mydb-final-snapshot"

  skip_final_snapshot = true

  tags = {
    Name = "my-rds"
  }
}

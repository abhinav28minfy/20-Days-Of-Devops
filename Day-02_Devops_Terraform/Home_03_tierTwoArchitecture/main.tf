provider "aws" {
  region = var.region
  profile = "abhinav"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "web_server" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  key_name              = "abhinav-kp"  # Replace with your key pair name
  subnet_id             = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd mysql
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Web Server in Public Subnet</h1>" > /var/www/html/index.html
              echo "<p>This server can connect to the database in the private subnet.</p>" >> /var/www/html/index.html
              EOF

  tags = {
    Name = "web-server"
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "main-subnet-group"
  subnet_ids = [aws_subnet.private.id, aws_subnet.public.id]

  tags = {
    Name = "main-db-subnet-group"
  }
}

resource "aws_db_instance" "database" {
  allocated_storage      = 20
  storage_type          = "gp2"
  engine                = "mysql"
  engine_version        = "8.0"
  instance_class        = "db.t3.micro"
  db_name               = "webapp"
  username              = "admin"
  password              = var.db_password
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name  = aws_db_subnet_group.main.name
  skip_final_snapshot   = true

  tags = {
    Name = "webapp-database"
  }
}
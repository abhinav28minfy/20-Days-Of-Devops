provider "aws"{
    profile= "abhinav"
    region="ap-south-1"
}

resource "aws_vpc" "abhinav_vpc"{
    cidr_block=var.vcp_cidr_block
    enable_dns_hostnames=true
}

resource "aws_subnet" "public_subnet"{
    vpc_id=aws_vpc.abhinav_vpc.id
    cidr_block="10.0.1.0/24"
    map_public_ip_on_launch=true
    availability_zone="ap-south-1a"
}

resource "aws_internet_gateway" "igw"{
    vpc_id=aws_vpc.abhinav_vpc.id
}

resource "aws_route_table" "public"{
    vpc_id=aws_vpc.abhinav_vpc.id

    route{
        cidr_block="0.0.0.0/0"
        gateway_id=aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "public"{
    subnet_id=aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.abhinav_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
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

resource "aws_instance" "abhinav_instance" {
    ami=var.aws_instance_ami
    subnet_id=aws_subnet.public_subnet.id
    security_groups=[aws_security_group.web_sg.id]
    instance_type="t2.micro"
    vpc_security_group_ids=[aws_security_group.web_sg.id]
    key_name="abhinav-kp"
    
    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd
                systemctl enable httpd
                echo "<h1>Hello World from $(hostname -f) - Abhinav</h1>" > /var/www/html/index.html
                EOF
}
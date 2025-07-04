terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  profile = "abhinav"
  region  = var.aws_region
}

resource "aws_vpc" "abhinav_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "Abhinav-VPC"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.abhinav_vpc.id

  tags = {
    Name = "Abhinav-IGW"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.abhinav_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name = "Abhinav-Public-Subnet"
    Type = "Public"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.abhinav_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Abhinav-Public-RT"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "web_sg" {
  name        = "abhinav-web-sg"
  vpc_id      = aws_vpc.abhinav_vpc.id

  # SSH access
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # All outbound traffic
  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Abhinav-Web-SG"
  }
}

# Call the EC2 instance module
module "abhinav_web_server" {
  source = "./modules/ec2_instance"

  # Pass values to the module's variables
  instance_type= var.instance_type
  ami_id             = var.aws_instance_ami
  subnet_id          = aws_subnet.public_subnet.id
  security_group_ids = [aws_security_group.web_sg.id]
  
  tags = {
    Name        = "Abhinav-WebServer-from-Module"
    Environment = var.environment
    Owner       = "Abhinav"
    Project     = "Assignment-02"
  }
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" 
    }
  }
  
  backend "s3" {
    bucket  = "abhinav_bucket_1"
    key     = "s3-bucket/terraform.tfstate"
    region  = "ap-south-1"
    profile = "abhinav"
    encrypt = true
  }
}

provider "aws" {
  profile = "abhinav"
  region  = "ap-south-1"
}

resource "aws_s3_bucket" "abhinav_bucket_1" {
  bucket = "abhinav_bucket_1"
}

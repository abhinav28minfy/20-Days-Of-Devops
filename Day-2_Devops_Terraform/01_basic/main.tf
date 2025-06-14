terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Use latest stable version
    }
  }
}

provider "aws"{
    profile="abhinav"
    region= "ap-south-1"
}

resource "aws_s3_bucket" "minfy-training-abhinav-s3-1" {
  bucket = "minfy-training-abhinav-s3-1"
}
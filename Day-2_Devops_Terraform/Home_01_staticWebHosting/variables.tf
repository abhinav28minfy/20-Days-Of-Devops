variable "aws_region" {
    description = "aws region"
    type=string
    default = "ap-south-1"
}

variable "bucket_name" {
    description = "S3 bucket name"
    type = string
    default = "abhinav-static-web-s3"
}
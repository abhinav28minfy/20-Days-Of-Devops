variable "db_password" {
  description = "Password for the RDS database"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "availability_zone_a" {
  description = "First availability zone"
  type        = string
  default     = "ap-south-1a"
}

variable "availability_zone_b" {
  description = "Second availability zone"
  type        = string
  default     = "ap-south-1b"
}
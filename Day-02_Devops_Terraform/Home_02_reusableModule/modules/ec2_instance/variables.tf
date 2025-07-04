# EC2 Instance Module - Variables

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"

  validation {
    condition = contains([
      "t2.micro", "t2.small", "t2.medium", "t2.large",
      "t3.micro", "t3.small", "t3.medium", "t3.large"
    ], var.instance_type)
    error_message = "Instance type must be a valid EC2 instance type."
  }
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance. If empty, will use the latest Amazon Linux 2 AMI."
  type        = string
  default     = "ami-0e670eb768a5fc3d4"
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched"
  type        = string

  validation {
    condition     = can(regex("^subnet-[0-9a-f]{8,17}$", var.subnet_id))
    error_message = "Subnet ID must be a valid AWS subnet ID format."
  }
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to the EC2 instance"
  type        = list(string)

  validation {
    condition     = length(var.security_group_ids) > 0
    error_message = "At least one security group ID must be provided."
  }
}

variable "tags" {
  description = "A map of tags to assign to the EC2 instance"
  type        = map(string)
  default     = {}
}
variable "vcp_cidr_block"{
    description="CIDR Block"
    type=string
    default="10.0.0.0/16"
}

variable "instance_type"{
    description="EC2 Instace Type"
    type=string
    default="t2.micro"
}

variable "aws_instance_ami"{
    description="AMI"
    type=string
    default="ami-0e670eb768a5fc3d4"
}

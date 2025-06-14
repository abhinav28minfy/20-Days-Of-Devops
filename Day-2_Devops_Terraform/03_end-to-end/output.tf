output "instance_public_ip" {
    description = "Public IP address of the EC2 instance"
    value       = aws_instance.abhinav_instance.public_ip
}

output "instance_private_ip" {
    description = "Public DNS name of the EC2 instance"
    value       = aws_instance.abhinav_instance.private_ip
}
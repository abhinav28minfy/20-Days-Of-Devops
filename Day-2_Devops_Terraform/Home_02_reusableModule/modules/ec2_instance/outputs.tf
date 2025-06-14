# EC2 Instance Module - Outputs

output "id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.abhinav_web_server.id
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.abhinav_web_server.public_ip
}

output "private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.abhinav_web_server.private_ip
}

output "public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.abhinav_web_server.public_dns
}

output "instance_state" {
  description = "State of the EC2 instance"
  value       = aws_instance.abhinav_web_server.instance_state
}

output "availability_zone" {
  description = "Availability zone of the EC2 instance"
  value       = aws_instance.abhinav_web_server.availability_zone
}
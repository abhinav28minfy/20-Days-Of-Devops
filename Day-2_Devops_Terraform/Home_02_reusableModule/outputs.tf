output "web_server_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.abhinav_web_server.public_ip
}

output "web_server_private_ip" {
  description = "Private IP of the EC2 instance"
  value       = module.abhinav_web_server.private_ip
}

output "web_server_url" {
  description = "URL to access the web server"
  value       = "http://${module.abhinav_web_server.public_ip}"
}

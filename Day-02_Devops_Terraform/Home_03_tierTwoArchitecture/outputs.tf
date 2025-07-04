output "web_server_public_ip" {
  description = "Public IP address of the web server"
  value       = aws_instance.web_server.public_ip
}

output "database_endpoint" {
  description = "RDS database endpoint"
  value       = aws_db_instance.database.endpoint
}

output "web_server_url" {
  description = "URL to access the web server"
  value       = "http://${aws_instance.web_server.public_ip}"
}
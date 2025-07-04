
output "website_endpoint" {
  description = "Website endpoint URL"
  value       = aws_s3_bucket_website_configuration.website_config.website_endpoint
}

output "website_url" {
  description = "Complete website URL with HTTP protocol"
  value       = "http://${aws_s3_bucket_website_configuration.website_config.website_endpoint}"
}
resource "aws_instance" "abhinav_web_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name = "abhinav-kp"

  # User data script to install and start Apache web server
  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello World from $(hostname -f) - Abhinav</h1>" > /var/www/html/index.html
              EOF
  )

  # Apply tags to the instance
  tags = merge(
    {
      Name = "Abhinav-WebServer-Module"
      Type = "WebServer"
    },
    var.tags
  )
}
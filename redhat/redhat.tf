provider "aws" {
  region = "us-east-1"
  # Add other provider-specific configurations
}

resource "aws_instance" "rhel_instance" {
  ami             = "ami-xxxxxxxxxxxxxxxx"  # Replace with the appropriate RHEL AMI
  instance_type   = "t2.micro"
  key_name        = "your-key-pair"
  security_group  = ["your-security-group"]  # Add security groups

  tags = {
    Name = "RedHatInstance"
  }
}

output "instance_ip" {
  value = aws_instance.rhel_instance.public_ip
}
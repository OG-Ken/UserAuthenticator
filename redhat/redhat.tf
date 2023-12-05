provider "aws" {
  region = "us-east-1"
  # Add other provider-specific configurations
}

resource "aws_instance" "rhel_instance" {
  ami             = "ami-XXXXXX"  # Replace with the appropriate RHEL AMI
  instance_type   = "t2.medium"   # Update to a larger instance type
  key_name        = "key-pair"
  #security_group  = ["security-group"]  # Add security groups
  ebs_optimized   = true          # Enable EBS optimization
  iam_instance_profile = "iam-role" # Assign an IAM role

  user_data = <<-EOF
                #!/bin/bash
                sudo yum update -y
                # Add other configuration commands
                EOF

  tags = {
    Name = "RedHatInstance"
  }
}

output "instance_ip" {
  value = aws_instance.rhel_instance.public_ip
}
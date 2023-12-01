#!/bin/bash

#move to the installation folder to run initial scripts
cd ../redhat

# Terraform initialization and apply
echo "Initializing Terraform..."
terraform init

echo "Applying Terraform configuration..."
terraform apply -auto-approve

# Extracting the instance IP from Terraform output
instance_ip=$(terraform output -json instance_ip | jq -r .)

# Wait for SSH to become available
echo "Waiting for SSH to become available..."
until ssh -o StrictHostKeyChecking=no -i path/to/your/private/key.pem ec2-user@${instance_ip} "echo 'SSH is ready'"
do
  sleep 5
done

# Run Ansible playbook to configure the instance
echo "Running Ansible playbook..."
ansible-playbook -i ${instance_ip}, -u ec2-user -i configure_instance.yml --extra-vars "@variables.yml"

echo "Deployment completed successfully!"
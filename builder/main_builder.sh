#!/bin/bash

# Add execute permissions to all scripts
chmod +x ../ansible/ansible.sh ../redhat.sh

echo "Running Ansible Deployment"
source ../ansible/ansible.sh

echo "Running RHEL Environment"
source ../redhat/redhat.sh


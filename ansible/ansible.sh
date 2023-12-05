#!/bin/bash

# Check if the Ansible deployment is running, if so, delete it, otherwise create it
if kubectl get deployments | grep ansible-deployment; then
    kubectl delete -f ansible-configmap.yaml
    kubectl delete -f ansible_deployment.yaml
    kubectl delete -f ansible-service.yaml
else
    kubectl apply -f ansible-configmap.yaml
    kubectl apply -f ansible-deployment.yaml
    kubectl apply -f ansible-service.yaml
fi


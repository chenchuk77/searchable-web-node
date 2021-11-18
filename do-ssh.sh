#!/bin/bash

# using terraform outputs to ssh to instance
# because public ip will change when destroy/apply

ssh -o StrictHostKeyChecking=no \
	-i ./tf-cloud-init terraform@$(terraform output -json | jq -r '.instance_public_ip.value')


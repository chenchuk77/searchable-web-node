#!/bin/bash

#ssh -i ./tf-cloud-init terraform@54.154.233.211
ssh -i ./tf-cloud-init terraform@$(terraform output -json | jq -r '.instance_public_ip.value')


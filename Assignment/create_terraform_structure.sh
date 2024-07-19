#!/bin/bash

# Define the directory structure
directories=(
    "terraform-vpc-setup"
    "terraform-vpc-setup/modules"
    "terraform-vpc-setup/modules/vpc"
    "terraform-vpc-setup/modules/subnet"
    "terraform-vpc-setup/modules/ec2"
    "terraform-vpc-setup/modules/security-group"
    "terraform-vpc-setup/modules/nat-gateway"
    "terraform-vpc-setup/scripts"
)

# Define the files to be created
files=(
    "terraform-vpc-setup/main.tf"
    "terraform-vpc-setup/variables.tf"
    "terraform-vpc-setup/outputs.tf"
    "terraform-vpc-setup/modules/vpc/main.tf"
    "terraform-vpc-setup/modules/vpc/variables.tf"
    "terraform-vpc-setup/modules/vpc/outputs.tf"
    "terraform-vpc-setup/modules/subnet/main.tf"
    "terraform-vpc-setup/modules/subnet/variables.tf"
    "terraform-vpc-setup/modules/subnet/outputs.tf"
    "terraform-vpc-setup/modules/ec2/main.tf"
    "terraform-vpc-setup/modules/ec2/variables.tf"
    "terraform-vpc-setup/modules/ec2/outputs.tf"
    "terraform-vpc-setup/modules/security-group/main.tf"
    "terraform-vpc-setup/modules/security-group/variables.tf"
    "terraform-vpc-setup/modules/security-group/outputs.tf"
    "terraform-vpc-setup/modules/nat-gateway/main.tf"
    "terraform-vpc-setup/modules/nat-gateway/variables.tf"
    "terraform-vpc-setup/modules/nat-gateway/outputs.tf"
    "terraform-vpc-setup/scripts/install_nginx.sh"
    "terraform-vpc-setup/scripts/install_postgresql.sh"
)

# Create the directories
for dir in "${directories[@]}"; do
    mkdir -p "$dir"
done

# Create the files
for file in "${files[@]}"; do
    touch "$file"
done

echo "Directory structure created successfully."


#!/bin/bash

# Define the base directory
BASE_DIR="terraform"

# Define the directory structure
DIRECTORIES=(
    "$BASE_DIR"
    "$BASE_DIR/vpc"
    "$BASE_DIR/subnets"
    "$BASE_DIR/route_tables"
    "$BASE_DIR/nat_gateway"
    "$BASE_DIR/ec2_instances"
)

# Define the files to be created in each directory
FILES=(
    "main.tf"
    "variables.tf"
    "outputs.tf"
)

# Create the directories
for DIR in "${DIRECTORIES[@]}"; do
    mkdir -p "$DIR"
done

# Create the files in the base directory
for FILE in "${FILES[@]}"; do
    touch "$BASE_DIR/$FILE"
done

# Create the files in each sub-directory
for DIR in "${DIRECTORIES[@]}"; do
    if [ "$DIR" != "$BASE_DIR" ]; then
        for FILE in "${FILES[@]}"; do
            touch "$DIR/$FILE"
        done
    fi
done

echo "Directory structure and files created successfully."


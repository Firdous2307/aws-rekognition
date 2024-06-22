#!/bin/bash

# This script comments out specific Terraform module blocks in the root-main.tf file and
# entire file content in module .tf files to streamline the provisioning process during 'terraform apply --auto-approve'.

# List of modules to comment out in the root configuration file
root_modules=("s3" "lambda" "eventbridge" "vpc" "iam" "ec2" "ecr")

# List of modules and their corresponding directory names to comment out
declare -A modules=(
  ["ec2"]="ec2"
  ["eventbridge"]="eventbridge"
  ["s3"]="s3"
  ["lambda"]="lambda"
  ["ecr"]="ecr"
  ["vpc"]="vpc"
)

# Function to comment out module blocks in the root configuration file
# Function to comment out specific module blocks in the root configuration file
comment_root_modules() {
  root_file="root-main.tf"
  if [[ -f $root_file ]]; then
    echo "File exists: $root_file"
    # Comment out specific services
    sed -i '/module "s3" {/,/}/ s/^/#/' "$root_file"
    sed -i '/module "lambda" {/,/}/ s/^/#/' "$root_file"
    sed -i '/module "eventbridge" {/,/}/ s/^/#/' "$root_file"
    sed -i '/module "vpc" {/,/}/ s/^/#/' "$root_file"
    sed -i '/module "iam" {/,/}/ s/^/#/' "$root_file"
    sed -i '/module "ec2" {/,/}/ s/^/#/' "$root_file"
    sed -i '/module "ecr" {/,/}/ s/^/#/' "$root_file"
  else
    echo "Root file not found: $root_file"
  fi
}


# Function to comment out entire file content using block comments
comment_entire_file() {
  files=("root-output.tf")  # Add root-output.tf to the list of files
  for module in "${!modules[@]}"; do
    echo "Processing module: $module"
    dir=${modules[$module]}
    module_files=("modules/$dir/main-$module.tf" "modules/$dir/output-$module.tf" "modules/$dir/variables-$module.tf")
    files+=("${module_files[@]}")
  done

  for file in "${files[@]}"; do
    echo "Processing file: $file"
    if [[ -f $file ]]; then
      echo "File exists: $file"
      # Add block comments at the beginning and end of the file
      sed -i '1s/^/\/\*\n/' "$file"
      echo '*/' >> "$file"
    else
      echo "File not found: $file"
    fi
  done
}

# Execute the functions
comment_root_modules
comment_entire_file

echo "Commented out specified modules in the root-main.tf file and all lines in specified .tf files using block comments."

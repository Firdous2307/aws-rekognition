#!/bin/bash

# This script removes comments added by the comment script.

# List of modules to uncomment in the root configuration file
root_modules=("s3" "lambda" "eventbridge" "vpc" "iam" "ec2" "ecr")

# List of modules and their corresponding directory names to uncomment
declare -A modules=(
  ["ec2"]="ec2"
  ["eventbridge"]="eventbridge"
  ["s3"]="s3"
  ["lambda"]="lambda"
  ["ecr"]="ecr"
  ["vpc"]="vpc"
)

# Function to uncomment module blocks in the root configuration file
uncomment_root_modules() {
  root_file="root-main.tf"
  if [[ -f $root_file ]]; then
    echo "File exists: $root_file"
    for module in "${root_modules[@]}"; do
      echo "Uncommenting module: $module in $root_file"
      sed -i 's/^#//' "$root_file"
    done
  else
    echo "Root file not found: $root_file"
  fi
}

# Function to uncomment entire file content by removing block comments
uncomment_entire_file() {
  files=("root-output.tf") # Add root-output.tf to the list of files
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
      # Remove block comments from the beginning and end of the file
      sed -i 's/\/\*//' "$file"
      sed -i 's/\*\///' "$file"
    else
      echo "File not found: $file"
    fi
  done
}

# Execute the functions
uncomment_root_modules
uncomment_entire_file

echo "Uncommented specified modules in the root-main.tf file and all lines in specified .tf files by removing comments."

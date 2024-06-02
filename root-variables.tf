variable "region" {
  description = "The AWS region"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "lambda_function_code" {
  description = "The file path of the Lambda function code ZIP archive"
  type        = string
}

variable "event_rule_name" {
  description = "The name of the EventBridge rule"
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "availability_zone" {
  description = "The name of the Availability Zone"
  type        = string
}

variable "ec2_role_name" {
  type    = string
}

variable "ec2_role_assume_role_policy" {
  type    = string
}

variable "ec2_role_managed_policy_arns" {
  type    = list(string)
}

variable "ec2_role_policies" {
  type    = list(string)
}

variable "ec2_instance_profile_name" {
  type    = string
}

variable "latest_ami_id" {
  description = "The latest AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
}

variable "ec2_instance_name" {
  description = "The name of the EC2 instance"
  type        = string
}

variable "ec2_user_data" {
  description = "The user data for the EC2 instance"
  type        = string
}

variable "account_id" {
  description = "AWS account ID"
  type        = string
}

variable "repo_name" {
  description = "ECR repository name"
  type        = string
}
variable "image_url" {
  description = "The Image Url of the Docker Image"
  type        = string
}
variable "aws_ecs_cluster" {
  description = "Name of ECS Cluster"
  type        = string 
}

variable "ecs_role_name" {
  description = "Name of ECS Role"
  type        = string 
}
variable "ecs_role_policies" {
  description = "Name of ECS Policies"
  type        = string  
}
variable "ecs_policy_arn" {
  type = string
}

variable "ecs_execution_role" {
  type = string
}
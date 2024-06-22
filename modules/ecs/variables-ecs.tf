variable "region" {
  type    = string
  default = "us-east-2"
}

variable "image_url" {
  type = string
}

variable "aws_ecs_cluster" {
  type = string
}

variable "bucket_name" {
  type = string  
}

variable "ecs_execution_role" {
  type    = string
}

variable "ecs_policy_arn" {
  type    = string
}

variable "ecs_execution_role_arn" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-2"
}

variable "ec2_role_name" {
  description = "The name of the IAM role for EC2"
  type        = string
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

variable "ecs_role_name" {
  type = string
}

variable "ecs_role_policies" {
  type = string
  
}
variable "ecs_policy_arn" {
  type = string
}
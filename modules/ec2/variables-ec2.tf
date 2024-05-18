variable "region" {
  type    = string
  default = "us-east-2"
}

variable "latest_ami_id" {
  description = "The ID of the latest AMI to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
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

variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string    
}

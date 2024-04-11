variable "region" {
  type    = string
  default = "us-east-2"
}

variable "bucket_name" {
  type    = string
  default = "firdous-rekognition-image-bucket"
}

variable "lambda_function_name" {
  type    = string
  default = "demo-function"
}

variable "lambda_function_code" {
  type    = string
  default = "deployment_package.zip"
}

variable "event_rule_name" {
  description = "The name of the EventBridge rule"
  type        = string
  default     = "S3_Event_Rule"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/24"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "rekognition-vpc"  
}  
variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet"
  type        = string
  default     = "10.0.0.0/26"
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "demo-subnet"
}

variable "availability_zone" {
  description = "The name of the Availability Zone"
  type        = string
  default     = "us-east-2a"
}
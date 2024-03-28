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


/*
variable "latest_ami_id" {
  type    = string
  default = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}
*/
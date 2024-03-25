variable "region" {
  type    = string
  default = "us-east-2" # Update with your desired AWS region
}

variable "bucket_name" {
  type    = string
  default = "firdous-rekognition-image-bucket" # Update with your desired S3 bucket name
}

variable "lambda_function_name" {
  type    = string
  default = "your-lambda-function-name" # Update with your desired Lambda function name
}

variable "lambda_function_code" {
  type    = string
  default = "lambda_function_payload.zip" # Update with your Lambda function code file
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
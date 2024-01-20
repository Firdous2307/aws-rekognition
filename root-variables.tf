# variables.tf

variable "region" {
  type    = string
  default = "us-east-1" # Update with your desired AWS region
}

variable "bucket_name" {
  type    = string
  default = "your-s3-bucket-name" # Update with your desired S3 bucket name
}

variable "lambda_function_name" {
  type    = string
  default = "your-lambda-function-name" # Update with your desired Lambda function name
}

variable "lambda_function_code" {
  type    = string
  default = "lambda_function_payload.zip" # Update with your Lambda function code file
}

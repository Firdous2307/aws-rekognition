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
  default = "lambda-demo-function"
}

variable "event_rule_name" {
  description = "The name of the EventBridge rule"
  type        = string
  default     = "s3_event_rule"
}

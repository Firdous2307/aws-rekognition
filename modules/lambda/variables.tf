variable "bucket_name" {
  type    = string
  default = "firdous-rekognition-image-bucket"
}

variable "lambda_function_name" {
  type    = string
  default = "lambda-demo-function"
}

variable "lambda_function_code" {
  type    = string
  default = "lambda_function_payload.zip"
}

variable "region" {
  type    = string
  default = "us-east-2"
}

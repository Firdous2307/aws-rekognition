# modules/lambda/main.tf
/*
provider "aws" {
  region = var.region
}

resource "aws_lambda_function" "this" {
  function_name = var.lambda_function_name
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  filename      = var.lambda_function_code
  source_code_hash = filebase64(var.lambda_function_code)

  role = aws_iam_role.lambda_exec.arn

  environment = {
    BUCKET_NAME = aws_s3_bucket.this.bucket
  }
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"
  
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      }
    }
  ]
}
POLICY
}

resource "aws_iam_policy_attachment" "lambda_s3_attachment" {
  policy_arn = aws_iam_policy.lambda_s3.arn
  roles      = [aws_iam_role.lambda_exec.name]
}

resource "aws_iam_policy" "lambda_s3" {
  name        = "lambda_s3_policy"
  description = "IAM policy for Lambda S3 access"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource": [
        "arn:aws:s3:::${var.bucket_name}/*"
      ]
    }
  ]
}
POLICY
}

# Output configurations
output "lambda_function_arn" {
  value = aws_lambda_function.this.arn
}
*/
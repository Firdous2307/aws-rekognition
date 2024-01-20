# modules/lambda/main.tf

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

# ... (IAM role and other configurations)

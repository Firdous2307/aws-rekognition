provider "aws" {
  region = var.region
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "lambda_s3" {
  statement {
    effect = "Allow"

    actions = ["s3:GetObject", "s3:PutObject"]

    resources = [
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
  }
}

resource "aws_iam_policy" "lambda_s3" {
  name        = "lambda_s3_policy"
  description = "IAM policy for Lambda S3 access"
  policy      = data.aws_iam_policy_document.lambda_s3.json
}


# Define CloudWatch Logs group for Lambda function logs
resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name = "/aws/lambda/${aws_lambda_function.test_lambda.function_name}"
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "/workspace/aws-rekognition-with-messi-or-ronaldo/lambda-function/lambda.js"
  output_path = "lambda_function_payload.zip"
}


resource "aws_lambda_function" "test_lambda" {
  filename          = var.lambda_function_code
  function_name     = "lambda-demo-function"
  role              = aws_iam_role.iam_for_lambda.arn
  handler           = "index.handler"
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime           = "nodejs18.x"
  
  environment {
    variables = {
      BUCKET_NAME = "firdous-rekognition-image-bucket"
      }
  }
}              
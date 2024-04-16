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

resource "aws_iam_policy" "lambda_basic_execution_policy" {
  name        = "LambdaBasicExecutionPolicy"
  description = "Provides basic execution permissions for Lambda functions"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_execution_attachment" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_basic_execution_policy.arn
}

data "aws_iam_policy_document" "lambda_s3" {
  statement {
    effect = "Allow"

    actions = ["s3:GetObject", "s3:PutObject", "s3:ListBucket"]

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

resource "aws_iam_role_policy_attachment" "lambda_s3_attachment" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_s3.arn
}

# Define CloudWatch Logs group for Lambda function logs
resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name = "/aws/${aws_lambda_function.test_lambda.function_name}"
}

data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "/workspace/aws-rekognition-with-messi-or-ronaldo/lambda-function"
  output_path = "deployment_package.zip"
}

resource "aws_lambda_function" "test_lambda" {
  filename          = var.lambda_function_code
  function_name     = "lambda-demo-function"
  role              = aws_iam_role.iam_for_lambda.arn
  handler           = "index.handler"
  source_code_hash  = data.archive_file.lambda.output_base64sha256
  runtime           = "nodejs18.x"
  
  environment {
    variables = {
      BUCKET_NAME = var.bucket_name
    }
  }
}

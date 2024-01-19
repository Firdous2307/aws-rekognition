# modules/cloudwatch/main.tf

provider "aws" {
  region = var.region
}

resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = 30
}

resource "aws_cloudwatch_metric_alarm" "lambda_errors" {
  # ... (configure CloudWatch alarm for Lambda errors)
}

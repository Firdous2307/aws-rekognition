provider "aws" {
  region = var.region
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
}

variable "lambda_function_arn" {
  description = "ARN of the Lambda function"
}

# Import IAM role as data
data "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"
}

# Reference existing Lambda function
data "aws_lambda_function" "test_lambda" {
  function_name = "lambda-demo-function"
}

# Reference existing S3 bucket
data "aws_s3_bucket" "firdous_rekognition_image_bucket" {
  bucket = var.bucket_name
}


resource "aws_cloudwatch_event_rule" "s3_event_rule" {
  name        = "s3_event_rule"
  description = "Trigger Lambda function on S3 object creation"
  event_pattern = jsonencode({
    source      = ["aws.s3"],
    detail      = {
      eventName = ["PutObject"]
    },
    resources   = [var.s3_bucket_arn],  # Use input variable here
    detailType  = ["AWS API Call via CloudTrail"]
  })

}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.s3_event_rule.name
  target_id = "invoke_lambda_function"
  arn       = var.lambda_function_arn  
}

resource "aws_lambda_permission" "allow_s3_invoke_lambda" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = data.aws_lambda_function.test_lambda.arn 
  principal     = "s3.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.s3_event_rule.arn
}

provider "aws" {
  region = var.region
}


# Import IAM role as data
data "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"
}

# Define the Lambda function
resource "aws_lambda_function" "test_lambda" { 
  function_name    = "lambda-demo-function"
  role             = data.aws_iam_role.iam_for_lambda.arn 
}

# Define the S3 bucket
resource "aws_s3_bucket" "firdous_rekognition_image_bucket" {
  bucket = var.bucket_name
 
}

# Define EventBridge rule for S3 events
resource "aws_cloudwatch_event_rule" "s3_event_rule" {
  name        = "s3_event_rule"
  description         = "Trigger Lambda function on S3 object creation"
  event_pattern = jsonencode({
    source      = ["aws.s3"],
    detail      = {
      eventName = ["PutObject"]
    },
    resources   = [aws_s3_bucket.firdous_rekognition_image_bucket.arn]
    detailType  = ["AWS API Call via CloudTrail"]
  })
}

# Define EventBridge target to invoke Lambda function
resource "aws_cloudwatch_event_target" "lambda_target" {
  rule = aws_cloudwatch_event_rule.s3_event_rule.name
  target_id = "invoke_lambda_function"
  arn = aws_lambda_function.test_lambda.arn

}

# Allow S3 to invoke Lambda function
resource "aws_lambda_permission" "allow_s3_invoke_lambda" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test_lambda.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.firdous_rekognition_image_bucket.arn
}

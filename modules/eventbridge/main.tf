# modules/eventbridge/main.tf

provider "aws" {
  region = var.region
}

resource "aws_cloudwatch_event_rule" "s3_event_rule" {
  name        = "s3_event_rule"
  description = "Event rule for S3 events"
  event_pattern = jsonencode({
    source      = ["aws.s3"],
    detail      = {
      eventName = ["PutObject"]
    },
    resources   = [aws_s3_bucket.this.arn],
    detailType  = ["AWS API Call via CloudTrail"]
  })
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule = aws_cloudwatch_event_rule.s3_event_rule.name
  arn  = aws_lambda_function.this.arn
}

output "s3_bucket_name" {
  value = aws_s3_bucket.firdous-rekognition-image-bucket.bucket
}

output "event_rule_id" {
  description = "The ID of the EventBridge rule"
  value       = aws_cloudwatch_event_rule.s3_event_rule.id
}

output "event_rule_arn" {
  description = "The ARN of the EventBridge rule"
  value       = aws_cloudwatch_event_rule.s3_event_rule.arn
}
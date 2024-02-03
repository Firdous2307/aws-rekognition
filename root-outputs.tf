# root-outputs.tf

output "s3_bucket_name" {
  value = module.s3.s3_bucket_name
}

output "s3_bucket_arn" {
  value = module.s3.s3_bucket_arn
}

output "s3_bucket_region" {
  value = module.s3.s3_bucket_region
}

output "s3_bucket_versioning_enabled" {
  value = module.s3.s3_bucket_versioning_enabled
}


output "s3_object_urls" {
  value = module.s3.s3_object_urls
}
/*
output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}

output "eventbridge_rule_arn" {
  value = module.eventbridge.eventbridge_rule_arn
}

output "cloudwatch_log_group_name" {
  value = module.cloudwatch.cloudwatch_log_group_name
}


output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_instance_id" {
  value = module.ec2.ec2_instance_id
}


output "ec2_role_name" {
  value = module.iam.ec2_role_name
}

output "ecs_role_name" {
  value = module.iam.ecs_role_name
}
*/

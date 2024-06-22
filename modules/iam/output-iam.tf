


output "ec2_role_arn" {
  value = aws_iam_role.ec2_role.arn
}

output "ec2_instance_profile_arn" {
  value = aws_iam_instance_profile.ec2_instance_profile.arn
}

output "ec2_instance_id" {
  value = aws_iam_instance_profile.ec2_instance_profile.id
}

output "ecs_role_name" {
  value = var.ecs_execution_role
}

output "ecs_execution_role" {
  description = "ECS execution role"
  value       = var.ecs_execution_role
}
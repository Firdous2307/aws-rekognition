output "aws_ecs_cluster" {
  value = aws_ecs_cluster.Rekognitioncluster
}

output "ecs_execution_role" {
  description = "ECS execution role"
  value = {
    name = aws_iam_role.ecs_execution_role.name
    arn  = aws_iam_role.ecs_execution_role.arn
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_ecs_cluster" "Rekognitioncluster" {
  name = var.aws_ecs_cluster

tags = {
    Name        = "RekognitionCluster"
    Environment = "Test"
}
}


resource "aws_ecs_task_definition" "Rekognition-TaskDefinition" {
  family = "Rekognition-TaskDefinition"
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  execution_role_arn = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "rekognition-test"
      image     =  var.image_url
      cpu       = 1
      memory    = 1024
      essential = true
      environment = [
        {
          name  = "BUCKET_NAME"
          value = var.bucket_name  
        },
      ]
    }
  ])

   tags = {
    Name = "Rekognition-TaskDefinition"
  }
}

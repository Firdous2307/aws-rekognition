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

  execution_role_arn        = var.ecs_execution_role_arn


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


resource "aws_iam_role" "ecs_execution_role" {
  name               = var.ecs_execution_role
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
      Action    = "sts:AssumeRole"
    }]
  })

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  ]

  tags = {
    Name = "ECSRole"
  }
}

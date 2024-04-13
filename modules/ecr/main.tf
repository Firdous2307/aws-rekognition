/*
variable "repository_name" {
  description = "The name of the ECR repository"
  type        = string
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_ecr_repository" "private_repo" {
  name = var.repository_name

  image_tag_mutability = "MUTABLE"
  scan_on_push         = false

  lifecycle {
    ignore_changes = [image_tag_mutability, scan_on_push]
  }

policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "AllowPushPull",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
        "ecr:PutImage",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload"
      ]
    }
  ]
}
EOF
}
*/
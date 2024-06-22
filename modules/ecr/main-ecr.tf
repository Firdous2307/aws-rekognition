/*





provider "aws" {
  region = "us-east-2"
}

resource "aws_ecr_repository" "private_repo" {
  name                 = "rekognition-repo"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_lifecycle_policy" "private_repo_policy" {
  repository = aws_ecr_repository.private_repo.name

  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 10 images with tag 'dev'",
      "selection": {
        "tagStatus": "tagged",
        "tagPrefixList": ["dev"],
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}





*/

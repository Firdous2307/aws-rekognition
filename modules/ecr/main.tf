provider "aws" {
  region = "us-east-2"
}

resource "aws_ecr_repository" "private_repo" {
  name             = "rekognition-repo"
  image_tag_mutability = "MUTABLE"
}

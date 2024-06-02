provider "aws" {
  region = "us-east-2"
}

resource "aws_ecs_cluster" "Rekognitioncluster" {
  name = "my-rekognition-cluster"

tags = {
    Name        = "RekognitionCluster"
    Environment = "Test"
}
}
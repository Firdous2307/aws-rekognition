terraform {
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "mohfird231"

  #  workspaces {
  #    name = "rekognition-demo-01"
  #  }
  #}
  cloud {
    organization = "mohfird231"

    workspaces {
      name = "rekognition-demo-01"
    }
  }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}

provider "aws" {
}

resource "aws_s3_bucket" "firdous-test-bucket" {
  bucket = "awesome-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
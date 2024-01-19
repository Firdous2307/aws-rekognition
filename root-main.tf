terraform {
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "mohfird231"

   # workspaces {
    #  name = "rekognition-demo-01"
    #}
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

provider "random" {
  # Configuration options
}


resource "random_string" "bucket_name" {
  lower = true
  upper = false
  length   = 32
  special  = false
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}

output "random_bucket_name" {
  value = random_string.bucket_name.result
}
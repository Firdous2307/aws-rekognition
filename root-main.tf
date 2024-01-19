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
provider "random" {
  # Configuration options
}

# [Random String Resource Docs]
# Available at:(https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)
resource "random_string" "bucket_name" {
  lower = true
  upper = false
  length   = 32
  special  = false
}

# [AWS S3 Bucket Resource Docs]
# Available at:(https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)
resource "aws_s3_bucket" "example" {
# [S3 Bucket Naming Rules]
# Available at:(https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html?icmpid=docs_amazons3_console)
  bucket = random_string.bucket_name.result
}

output "random_bucket_name" {
  value = random_string.bucket_name.result
}
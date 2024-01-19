terraform {
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "mohfird231"

  #  workspaces {
  #    name = "rekognition-demo-01"
  #  }
  #}
  #cloud {
  #  organization = "mohfird231"

  #  workspaces {
  #    name = "rekognition-demo-01"
  #  }
  #}
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

module "s3" {
  source          = "./modules/s3"
}
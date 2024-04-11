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
      source    = "hashicorp/random"
      version   = "3.5.1"
    }
    aws = {
      source    = "hashicorp/aws"
      version   = "5.16.2"
    }
  }
}

provider "aws" {
}

module "s3" {
  source       = "./modules/s3"
  bucket_name  = var.bucket_name
  region       = var.region
}

module "lambda" {
  source               = "./modules/lambda"
  lambda_function_name = var.lambda_function_name
  lambda_function_code = var.lambda_function_code
  region               = var.region
  bucket_name          = module.s3.s3_bucket_name
}

module "eventbridge" {
  source              = "./modules/eventbridge"
  region              = var.region
  s3_bucket_arn       = module.s3.s3_bucket_arn
  lambda_function_arn = module.lambda.lambda_function_arn
  event_rule_name     = var.event_rule_name
}

module "vpc" {
  source              = "./modules/vpc"
  subnet_cidr_block   = var.subnet_cidr_block
  subnet_name         = var.subnet_name
  availability_zone   = var.availability_zone
}

/*
module "iam" {
  source = "./modules/iam"
}

module "ec2" {
  source         = "./modules/ec2"
  latest_ami_id  = var.latest_ami_id
}
*/
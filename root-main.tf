terraform {
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "mohfird231"

  #  workspaces {
  #    name = "rekognition-project-01""
  #  }
  #}
  #cloud {
  #  organization = "mohfird231"

  #  workspaces {
  #    name = "rekognition-project-01"
  #  }
  #}
  required_providers {
    random = {
      source    = "hashicorp/random"
      version   = "3.5.1"
    }
    aws = {
      source    = "hashicorp/aws"
      version = "5.50.0"
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
  vpc_id              = var.vpc_id
  vpc_cidr_block      = var.vpc_cidr_block
  vpc_name            = var.vpc_name
  subnet_cidr_block   = var.subnet_cidr_block
  subnet_name         = var.subnet_name
  availability_zone   = var.availability_zone
}


module "iam" {
  source                        = "./modules/iam"
  ec2_role_name                 = var.ec2_role_name
  ec2_role_assume_role_policy     = var.ec2_role_assume_role_policy
  ec2_role_managed_policy_arns    = var.ec2_role_managed_policy_arns
  ec2_role_policies               = var.ec2_role_policies
  ec2_instance_profile_name       = var.ec2_instance_profile_name
}

module "ec2" {
  source            = "./modules/ec2"
  vpc_id              = var.vpc_id
  subnet_cidr_block   = var.subnet_cidr_block
  subnet_name       = var.subnet_name
  latest_ami_id     = var.latest_ami_id
  instance_type     = var.instance_type
  ec2_instance_name = var.ec2_instance_name
  ec2_user_data     = var.ec2_user_data
  }

module "ecr" {
  source            = "./modules/ecr"  
  region            = var.region 
  repository_name   = var.repo_name  
}
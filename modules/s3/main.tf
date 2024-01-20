provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "firdous-image-bucket" {
  bucket = var.bucket_name

  versioning {
    enabled = "true"
  }
}
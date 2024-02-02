provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "firdous-rekognition-image-bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "firdous-rekognition-image-bucket" {
  bucket = aws_s3_bucket.firdous-rekognition-image-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_object" "image_objects" {
  for_each = fileset("${path.module}/test-images", "*.*")

  bucket = aws_s3_bucket.firdous-rekognition-image-bucket.bucket
  key    = "uploads/${each.value}"
  source = "${path.module}/test-images/${each.value}"
}

resource "aws_s3_bucket_acl" "firdous-rekognition-image-bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.firdous-rekognition-image-bucket]

  bucket = aws_s3_bucket.firdous-rekognition-image-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_firdous-rekognition-image-bucket" {
  bucket = aws_s3_bucket.firdous-rekognition-image-bucket.id
  versioning_configuration {
    status = "Enabled"
  }  
}
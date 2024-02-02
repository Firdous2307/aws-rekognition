output "s3_bucket_name" {
  value = aws_s3_bucket.firdous-rekognition-image-bucket.bucket
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.firdous-rekognition-image-bucket.arn
}

output "s3_bucket_region" {
  value = aws_s3_bucket.firdous-rekognition-image-bucket.region
}

output "s3_bucket_versioning_enabled" {
  value = aws_s3_bucket_versioning.versioning_firdous-rekognition-image-bucket.versioning_configuration.0.status
}

output "image_objects_keys" {
  value = aws_s3_object.image_objects.*.id
}
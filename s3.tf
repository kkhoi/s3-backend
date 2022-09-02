resource "aws_s3_bucket" "test_s3_bucket" {
  bucket        = "${var.project}-s3-backend"
  force_destroy = false

  tags = local.tags
}

resource "aws_s3_bucket_acl" "test_s3_bucket" {
  bucket = aws_s3_bucket.test_s3_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "test_s3_bucket" {
  bucket = aws_s3_bucket.test_s3_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_kms_key" "kms_key" {
  tags = local.tags
}

resource "aws_s3_bucket_server_side_encryption_configuration" "test_s3_bucket" {
  bucket = aws_s3_bucket.test_s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.kms_key.arn
    }
  }
}
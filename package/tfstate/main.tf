variable "region" {
  type = string
  default = "us-west-2"
}

variable "bucket_prefix" {
  type = string
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "v3.10.1"

  bucket_prefix           = var.bucket_prefix
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  force_destroy = true
}

output "state_bucket_name" {
  value = module.s3_bucket.s3_bucket_id
}

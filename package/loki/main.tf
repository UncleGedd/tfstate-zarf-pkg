terraform {
  backend "s3" {}
}

variable "bucket_name" {
  type = string
  default = "gedd-dev-loki"
}

resource "aws_s3_bucket" "loki" {
  bucket = var.bucket_name
}
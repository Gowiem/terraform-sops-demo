locals {
  secrets = yamldecode(data.sops_file.secrets.raw)
}

data "sops_file" "secrets" {
  source_file = "./secrets.yaml"
}

resource "random_pet" "default" {}

module "bucket" {
  source  = "cloudposse/s3-bucket/aws"
  version = "0.35.0"

  namespace  = "mp"
  name       = "sops-demo"
  attributes = [random_pet.default.id]

  acl                 = "public-read"
  ignore_public_acls  = false
  block_public_acls   = false
  block_public_policy = false
  versioning_enabled  = false

  grants = [{
    id          = null
    type        = "Group"
    permissions = ["READ"]
    uri         = "http://acs.amazonaws.com/groups/global/AllUsers"
  }]
}

resource "aws_s3_bucket_object" "demo_json" {
  bucket       = module.bucket.bucket_id
  key          = "sops-demo.json"
  content      = jsonencode(local.secrets)
  acl          = "public-read"
  content_type = "application/json"
}

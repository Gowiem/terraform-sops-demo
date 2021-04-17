output "bucket_id" {
  value       = module.bucket.bucket_id
  description = "The identifier / name of created bucket which stores our JSON object."
}

output "object_url" {
  value       = "${module.bucket.bucket_domain_name}/sops-demo.json"
  description = "URL to the S3 object that we create."
}

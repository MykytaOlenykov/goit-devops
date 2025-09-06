output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = module.s3_backend.s3_bucket_name
}

output "s3_bucket_url" {
  description = "S3 bucket URL"
  value       = module.s3_backend.s3_bucket_url
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "vpc_private_subnets" {
  description = "VPC private subnets"
  value       = module.vpc.private_subnets
}

output "vpc_public_subnets" {
  description = "VPC public subnets"
  value       = module.vpc.public_subnets
}

output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = module.ecr.ecr_repository_url
}

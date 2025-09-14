#-------------Backend-----------------
output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = module.s3_backend.s3_bucket_name
}

output "s3_bucket_url" {
  description = "S3 bucket URL"
  value       = module.s3_backend.s3_bucket_url
}

#-------------VPC-----------------
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

#-------------ECR-----------------
output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = module.ecr.ecr_repository_url
}

#-------------EKS-----------------
output "eks_cluster_endpoint" {
  description = "EKS API endpoint for connecting to the cluster"
  value       = module.eks.eks_cluster_endpoint
}

output "eks_cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks.eks_cluster_name
}

output "eks_node_role_arn" {
  description = "IAM role ARN for EKS Worker Nodes"
  value       = module.eks.eks_node_role_arn
}

output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.oidc.arn
}

output "oidc_provider_url" {
  value = aws_iam_openid_connect_provider.oidc.url
}


#-------------Jenkins-----------------
output "jenkins_release" {
  description = "Jenkins release name"
  value       = module.jenkins.jenkins_release_name
}
output "jenkins_namespace" {
  description = "Jenkins namespace"
  value       = module.jenkins.jenkins_namespace
}

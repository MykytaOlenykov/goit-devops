output "ecr_repository_url" {
  description = "Full URL (hostname/name) for docker push/pull."
  value       = "https://${aws_ecr_repository.ecr.repository_url}"
}

output "erc_repository_arn" {
  description = "ARN of the created ECR repository."
  value       = aws_ecr_repository.ecr.arn
}
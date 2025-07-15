output "repository_url" {
  description = "URL of the ECR Repository"
  value       = aws_ecr_repository.tfm_microservice.repository_url
}

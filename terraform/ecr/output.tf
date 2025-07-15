output "repositories_urls" {
  description = "ECR repositories URLs"
  value = {
    for name, repo in aws_ecr_repository.repositories : name => repo.repository_url
  }
}

variable "subnet_public_ids" {
  description = "List of public subnet IDs for NLB (multi-AZ)"
  type        = list(string)
}
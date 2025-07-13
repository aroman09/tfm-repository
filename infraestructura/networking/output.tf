output "subnet_public_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.tfm_subnet_publica.id
}

output "subnet_private_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.tfm_subnet_privada.id
}
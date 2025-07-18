output "subnet_private_ids" {
  value = [
    aws_subnet.tfm_subnet_privada_1.id,
    aws_subnet.tfm_subnet_privada_2.id
  ]
}


output "subnet_public_ids" {
  value = [
    aws_subnet.tfm_subnet_publica_1.id,
    aws_subnet.tfm_subnet_publica_2.id
  ]
}

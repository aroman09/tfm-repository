resource "aws_lb" "tfm_nlb" {
  name               = "tfm-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = var.subnet_public_ids

  tags = {
    Name = "tfm-nlb"
  }
}
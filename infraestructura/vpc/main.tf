resource "aws_vpc" "tfm_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = "tfm-vpc"
  }
}
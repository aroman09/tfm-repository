provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source     = "./vpc"
  cidr_block = "10.0.0.0/16"
}

module "networking" {
  source = "./networking"
  vpc_id = module.vpc.vpc_id
}

module "nlb" {
  source           = "./nlb"
  subnet_public_id = module.networking.subnet_public_id
}
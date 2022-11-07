terraform {
  required_version = ">=1.0.2"
  required_providers {
    aws = ">=4.5.0"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
  prefix = var.prefix
  vpc_cidr_block = var.vpc_cidr_block
}

module "eks" {
  source = "./modules/eks"
  prefix = var.prefix
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
  cluster_name = var.cluster_name
  retention_days = var.retention_days
  desired_size = var.desired_size
  max_size = var.max_size
  min_size = var.min_size
}
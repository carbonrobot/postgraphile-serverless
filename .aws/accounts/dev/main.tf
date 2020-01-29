provider "aws" {
  version = "~> 2.39.0"
  region  = var.region
}

locals {
  project = "demo"
}

module "vpc" {
  source  = "../../modules/vpc"
  project = local.project
}

module "db" {
  source            = "../../modules/datastore"
  project           = local.project
  admin_username    = var.db_username
  admin_password    = var.db_password
  security_group_id = module.vpc.vpc_security_group_id
  subnet_ids        = module.vpc.vpc_private_subnets
}

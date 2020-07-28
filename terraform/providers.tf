provider "aws" {
  version = "~> 2.0"

  region = var.region
  allowed_account_ids = [var.account_id]
  profile = var.profile

}
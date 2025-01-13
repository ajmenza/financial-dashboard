provider "aws" {
  region = var.aws_region
}

module "iam" {
  source           = "modules/iam"
  account_id       = var.account_id
  github_repository = var.github_repository
}

output "github_actions_deploy_role_arn" {
  value = module.iam.github_actions_role_arn
}


output "console_user_access_key_id" {
  value = module.iam.console_user_access_key_id
}

output "console_user_secret_access_key" {
  value     = module.iam.console_user_secret_access_key
  sensitive = true
}

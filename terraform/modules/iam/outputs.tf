output "github_actions_role_arn" {
  value = aws_iam_role.github_actions_role.arn
}

output "console_user_access_key_id" {
  value = aws_iam_access_key.console_user_access_key.id
}

output "console_user_secret_access_key" {
  value     = aws_iam_access_key.console_user_access_key.secret
  sensitive = true
}

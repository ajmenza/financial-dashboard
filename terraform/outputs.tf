output "admin_user_access_key" {
  value       = aws_iam_access_key.admin_user_access_key.id
  description = "Access key ID for the Terraform admin user."
  sensitive   = true
}

output "admin_user_secret_key" {
  value       = aws_iam_access_key.admin_user_access_key.secret
  description = "Secret access key for the Terraform admin user."
  sensitive   = true
}

output "github_actions_role_arn" {
  value       = aws_iam_role.github_actions_role.arn
  description = "IAM Role ARN for GitHub Actions."
}

resource "aws_iam_role" "github_actions_role" {
  name = "GitHubActionsDeployRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::${account_id}:oidc-provider/token.actions.githubusercontent.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "token.actions.githubusercontent.com:sub": "repo:${github_repository}:ref:refs/heads/main"
        }
      }
    }
  ]
}
EOF
}

resource "aws_iam_user" "console_user" {
  name = "management-console-user"
}

resource "aws_iam_access_key" "console_user_access_key" {
  user = aws_iam_user.console_user.name
}

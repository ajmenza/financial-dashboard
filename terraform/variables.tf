variable "account_id" {
  description = "The AWS account ID where resources will be created."
  type        = string
}

variable "github_repository" {
  description = "The GitHub repository for the CICD pipeline (e.g., 'user/repo')."
  type        = string
}

variable "aws_region" {
  description = "The AWS region where resources will be created."
  default     = "us-east-1"
}

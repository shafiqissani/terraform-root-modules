variable "dev_account_id" {
  type        = "string"
  description = "Dev account ID"
}

variable "dev_account_user_names" {
  type        = "list"
  description = "IAM user names to grant access to Dev account"
}

# Provision group access to dev account
module "organization_access_group_dev" {
  source            = "git::https://github.com/cloudposse/terraform-aws-organization-access-group.git?ref=tags/0.1.3"
  namespace         = "${var.namespace}"
  stage             = "dev"
  name              = "admin"
  user_names        = ["${var.dev_account_user_names}"]
  member_account_id = "${var.dev_account_id}"
  require_mfa       = "true"
}

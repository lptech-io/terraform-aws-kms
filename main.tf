data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "base_policy" {
  statement {
    sid = "EnableRootAccountKmsManagement"
    actions = ["kms:*"]
    principals {
      type = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
    resources = ["*"]
    effect = "Allow"
  }
}

resource "aws_kms_key" "key" {
  description             = "${var.key_name} KMS key"
  deletion_window_in_days = 30
  enable_key_rotation     = true
  multi_region            = var.multi_region
  policy                  = data.aws_iam_policy_document.base_policy.json
}

resource "aws_kms_alias" "alias" {
  name          = "alias/${var.key_name}"
  target_key_id = aws_kms_key.key.key_id
}

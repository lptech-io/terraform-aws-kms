
output "alias" {
  description = "The alias created for the KMS key"
  value       = aws_kms_alias.key_alias.name
}

output "arn" {
  description = "The ARN of the KMS key"
  value       = aws_kms_key.key.arn
}

output "id" {
  description = "The Id of the KMS key"
  value       = aws_kms_key.key.key_id
}

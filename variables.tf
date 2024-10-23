variable "key_name" {
  description = "The name of the KMS key"
  type        = string
}

variable "multi_region" {
  default = false
  description = "Set key as multi-region"
  type = bool
}

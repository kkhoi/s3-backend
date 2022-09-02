variable "region" {
  type = string
  default = "ap-southeast-1"
}

variable "project" {
  description = "The project namespace to use for unique resource naming"
  default     = "terraform-test-s3"
  type        = string
}

variable "principal_arns" {
  description = "A list of principal arns allowed to assume the IAM role"
  default     = null
  type        = list(string)
}
variable "region" {
  type        = string
  description = "The region where resource must be created"
}

variable "account_id" {
  type        = string
  description = "The account id"
}

variable "stack_id" {
  type        = string
  description = "The prefix to identify the resources created by the module"
}

variable "profile" {
  type        = string
  description = "The aws terminal profile"
}

# variable "vpc_id" {
#   type        = string
#   description = "The identifier of the VPC where the resources will be provisioned"
# }
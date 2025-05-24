# variables.tf

variable "aws_region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "us-east-1"
}

# variables.tf
variable "example_vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_instance_tenancy" {
  description = "The instance tenancy for the VPC (default or dedicated)."
  type        = string
  default     = "default"
  validation {
    condition     = contains(["default", "dedicated"], var.vpc_instance_tenancy)
    error_message = "Instance tenancy must be either 'default' or 'dedicated'."
  }
}

variable "project_name" {
  description = "The value for the Project Name."
  type        = string
  default     = "my-project"
}

variable "environment" {
  description = "The value for the Environment tag of the VPC."
  type        = string
  default     = "dev"
}
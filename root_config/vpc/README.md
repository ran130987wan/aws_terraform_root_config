# Terraform AWS VPC Module Implementation

## Overview

This Terraform configuration creates an AWS VPC using a custom module from a GitHub repository. The setup includes:
- A configurable VPC with CIDR block
- Common tagging across resources
- Flexible configuration through variables

## Prerequisites

- Terraform v1.0+ installed
- AWS CLI configured with proper credentials
- Git (for module download)

## Configuration

### Input Variables

Configure these variables in your `terraform.tfvars` file:

```hcl
aws_region       = "us-east-1"  # AWS region
example_vpc_cidr = "10.0.0.0/16" # VPC CIDR block
project_name     = "my-project"  # Project identifier
environment      = "dev"         # Environment (dev/stage/prod)
```
## Module Usage
The VPC module is sourced from GitHub:
```hcl
module "my_custom_vpc" {
  source           = "github.com/ran130987wan/aws_terraform_module//modules/vpc"
  vpc_cidr_block   = var.example_vpc_cidr
  project_name     = var.project_name
  environment      = var.environment
  additional_tags  = local.root_level_common_tags
}
```

## Common Tags
Root-level tags are defined in locals.tf and automatically merged with module tags:
```hcl
root_level_common_tags = {
  Owner       = "MyTeam"
  CostCenter  = "ABC123"
  ManagedTool = "Terraform"
}
```

## Usage
1. Initialize Terraform:
```hcl
terraform init
```
1. Review execution plan:
```hcl
terraform plan
```
1. Apply configuration:
```hcl
terraform apply
```

## Outputs
After successful execution, the following output will be available:
```hcl
created_module_vpc_id = "vpc-1234567890abcdef0"
```

## Version Requirements
AWS Provider: ~> 5.0

## Notes
1. Ensure your AWS credentials have proper VPC creation permissions
2. The vpc_instance_tenancy variable defaults to "default" but can be set to "dedicated"
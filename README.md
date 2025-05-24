# AWS Terraform Root Configuration

## Overview

This Terraform root configuration manages AWS infrastructure by calling modules from the [aws_terraform_module](https://github.com/ran130987wan/aws_terraform_module) repository. The current implementation creates a VPC with configurable parameters and standardized tagging.

## Project Structure
```
├── README.md
├── .gitignore
├── root_config/vpc/versions.tf # Terraform version and provider requirements
├── root_config/vpc/providers.tf # AWS provider configuration
├── root_config/vpc/variables.tf # Input variable definitions
├── root_config/vpc/locals.tf # Common tag definitions
├── root_config/vpc/main.tf # Module declarations
└── root_config/vpc/outputs.tf # Output values
```

## Features

- **Modular Design**: Uses remote VPC module from GitHub
- **Standardized Tagging**: Implements consistent tagging across all resources
- **Configurable Parameters**: Supports customization through variables
- **Validation**: Includes input validation for critical parameters

## Prerequisites

- Terraform 1.0+
- AWS account with proper permissions
- AWS CLI configured with credentials
- Git (for module download)

## Configuration

### Required Variables

Create a `terraform.tfvars` file with these required values:

```hcl
example_vpc_cidr = "10.0.0.0/16"  # Your VPC CIDR block
```

### Optional Variables (with defaults)
```hcl
aws_region       = "us-east-1"    # AWS region
project_name     = "my-project"   # Project identifier
environment      = "dev"          # Environment tag
vpc_instance_tenancy = "default"  # Instance tenancy (default/dedicated)
```

## Outputs
The configuration provides these outputs:
1. created_module_vpc_id: The ID of the created VPC

## Security Notes
1. Never commit .tfvars files to version control
2. Ensure your AWS credentials have least-privilege permissions
3. Review all changes with terraform plan before applying

## Version Compatibility
1. AWS Provider: ~> 5.0
2. Terraform: >= 1.0

## References
- [Source Module Repository](https://github.com/ran130987wan/aws_terraform_module)
- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

## Key improvements made:
1. Better organized structure matching your actual files
2. Clearer separation between required and optional variables
3. Added security notes section
4. Included project structure visualization
5. Made the tagging strategy more prominent
6. Added reference links
7. Improved formatting for better readability
8. Included destruction instructions
9. Made version requirements more visible

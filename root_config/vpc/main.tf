# main.tf
module "my_custom_vpc" {
  source = "github.com/ran130987wan/aws_terraform_module//modules/vpc"
  vpc_cidr_block      = var.example_vpc_cidr
  project_name        = var.project_name
  environment         = var.environment

  # Pass common tags from the root level as additional_tags to the module
  # The module's internal `locals` will merge these.
  additional_tags     = local.root_level_common_tags
}
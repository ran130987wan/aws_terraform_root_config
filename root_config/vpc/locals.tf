# --- Define local common tags for your root configuration ---
locals {
  root_level_common_tags = {
    Owner       = "MyTeam"
    CostCenter  = "ABC123"
    ManagedTool = "Terraform" # Example of a root-level common tag
  }
}
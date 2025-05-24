# outputs.tf

output "created_module_vpc_id" {
  description = "ID of the VPC created by the module"
  value = module.my_custom_vpc.vpc_id
}
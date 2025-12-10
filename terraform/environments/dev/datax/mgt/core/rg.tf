# resource group for management application like monitoring, loging, github runner
module "resource_group" {
  source = "../../../../../modules/networking/resource-group"

  location     = var.location
  subsidiary   = var.subsidiary
  environment  = var.environment
  project_name = var.project_name
  service_name = var.service_name
  other_suffix = "01"
  tags         = local.tags
}

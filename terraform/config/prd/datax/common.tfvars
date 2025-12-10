rmbackend_resource_group_name  = "az-rg-dtx-ccoe-platform"
rmbackend_storage_account_name = "stdtxccoeplatformsea"
rmbackend_container_name       = "stcn-dtx-ccoe-platform-sea"

environment                    = "prd"
location                       = "southeastasia"
location_appb                  = "sea"
tenant_id                      = "f8034e73-cbcd-453e-8db6-c72986012b37"
connectivity_subscription_name = "datax-conn-prd-01"
connectivity_subscription_id   = "b48c4e64-17c9-41b1-8d65-b8e96df9b41e"
management_subscription_id     = "43b40993-d0fe-44a6-9e74-f9410e8be26c"
management_subscription_name   = "datax-mgmt-prd-01"
security_subscription_id       = "fda7c711-925b-450e-9387-d2117f89dca2"
security_subscription_name     = "datax-soc-prd-01"
# subsidiary                     = "datax"
subsidiary = "dtx"
# subsidiary_abbr                = "dtx"
subscription_name = "datax-prd-01"
subscription_id   = "d24a5252-73e7-47f7-9042-70be63653ff2"

project_name = "common-project"
service_name = "common-service"

common_tags = {
  "Workload" : "Financial",
  "Environment" : "Production",
  "Business criticality" : "0",
  "AppOwner" : "DataX",
  "Data Classification" : "High Sensitivity"
}

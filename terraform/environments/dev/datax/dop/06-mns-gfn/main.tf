locals {
  prometheus_datasource = var.prometheus_datasource
  infinity_datasource   = var.infinity_datasource
  databricks_datasource = var.databricks_datasource
}

# CardX MDZ SCB Dashboard and Alert
resource "grafana_folder" "cardx_folder" {
  title                        = "CardX MDZ SCB"
  prevent_destroy_if_not_empty = true
}
module "cardx_mdz_scb_kafka" {
  source = "../../../../../modules/monitoring_grafana/cardx_mdz_scb"

  prometheus_datasource = local.prometheus_datasource
  infinity_datasource   = local.infinity_datasource

  folder_name = grafana_folder.cardx_folder.title

  depends_on = [grafana_folder.cardx_folder]
}

module "databricks_dashboard" {
  source = "../../../../../modules/monitoring_grafana/databricks"

  folder_name           = "Databricks"
  databricks_datasource = local.databricks_datasource
  databricks_dashborad  = var.databricks_dashborad
}

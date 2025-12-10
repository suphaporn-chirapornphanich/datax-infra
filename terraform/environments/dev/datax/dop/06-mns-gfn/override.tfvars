grafana_url = "https://grafana.dev.int.data-x.ai"

# Data Source configuration
prometheus_datasource = "a4695040-c59c-4976-a92c-93c49b19031e"
infinity_datasource   = "adr7j5hfu4ruod"
databricks_datasource = "ede00d31-efd2-4877-9323-64671e75bfbe"

databricks_dashborad = {
  # DataX DPZ
  DataX_DPZ_SCB = {
    tables = {
      config_info              = "dtx_scbucgas_dev.fw_conf_gas_db.tbl_config_info"
      data_pipeline_status_log = "dtx_scbucgas_dev.fw_conf_gas_db.tbl_data_pipeline_status_log"
      schm_sync_log            = "dtx_scbucgas_dev.fw_conf_gas_db.tbl_schm_sync_log"
    }
    dashboards = [
      { title = "DPZ SCB FW4", dashboard_type = "fw4_dashboard" },
      { title = "DPZ SCB FW4 Log", dashboard_type = "fw4_log_dashboard" },
      { title = "DPZ SCB Schema Sync", dashboard_type = "dpz_schema_sync" }
    ]
  }
  DataX_DPZ_SEC = {
    tables = {
      config_info              = "dtx_sec_dev.fw_conf_cmmn_db.tbl_config_info"
      data_pipeline_status_log = "dtx_sec_dev.fw_conf_cmmn_db.tbl_data_pipeline_status_log"
    }
    dashboards = [
      { title = "DPZ DataX Secure Zone FW4", dashboard_type = "fw4_dashboard" },
      { title = "DPZ DataX Secure Zone FW4 Log", dashboard_type = "fw4_log_dashboard" }
    ]
  }
  DataX_DPZ_CUS = {
    tables = {
      config_info              = "dtx_cus_dev.fw_conf_custmas_db.tbl_config_info"
      data_pipeline_status_log = "dtx_cus_dev.fw_conf_custmas_db.tbl_data_pipeline_status_log"
    }
    dashboards = [
      { title = "DPZ DataX Customer Master FW4", dashboard_type = "fw4_dashboard" },
      { title = "DPZ DataX Customer Master FW4 Log", dashboard_type = "fw4_log_dashboard" }
    ]
  }

  DataX_DPZ_360 = {
    tables = {
      config_info                 = "dtx_c360_dev.fw_conf_c360_db.tbl_config_info"
      data_pipeline_status_log    = "dtx_c360_dev.fw_conf_c360_db.tbl_data_pipeline_status_log"
      az_monitor_source           = "f7b73550-a92c-4d5b-89f0-2887706f1bec"
      az_monitor_appi_resource_id = "/subscriptions/afb4e58e-af31-4ad6-9735-9ee8b63f0551/resourceGroups/az-rg-dtx-dtxdop-cmp-mns-dev-01/providers/Microsoft.Insights/components/az-appi-dtx-dtxdop-cmp-mnsadb-c360-01-dev"
    }
    dashboards = [
      { title = "DPZ DataX 360 FW4.1", dashboard_type = "fw41_dashboard" },
      { title = "DPZ DataX 360 FW4.1 Log", dashboard_type = "fw41_log_dashboard" }
    ]
  }

  # Monoline DPZ
  AutoX_GAS = {
    tables = {
      config_info              = "atx_gas_dev.fw_conf_gas_db.tbl_config_info"
      data_pipeline_status_log = "atx_gas_dev.fw_conf_gas_db.tbl_data_pipeline_status_log"
      schm_sync_log            = "atx_gas_dev.fw_conf_gas_db.tbl_schm_sync_log"
    }
    dashboards = [
      { title = "DPZ AutoX FW4", dashboard_type = "fw4_dashboard" },
      { title = "DPZ AutoX FW4 Log", dashboard_type = "fw4_log_dashboard" },
      { title = "DPZ AutoX Schema Sync", dashboard_type = "dpz_schema_sync" }
    ]
  }
  CardX_GAS = {
    tables = {
      config_info              = "cdx_gas_dev.fw_conf_gas_db.tbl_config_info"
      data_pipeline_status_log = "cdx_gas_dev.fw_conf_gas_db.tbl_data_pipeline_status_log"
      schm_sync_log            = "cdx_gas_dev.fw_conf_gas_db.tbl_schm_sync_log"
    }
    dashboards = [
      { title = "DPZ CardX FW4", dashboard_type = "fw4_dashboard" },
      { title = "DPZ CardX FW4 Log", dashboard_type = "fw4_log_dashboard" },
      { title = "DPZ CardX Schema Sync", dashboard_type = "dpz_schema_sync" }
    ]
  }
  InnovestX_GAS = {
    tables = {
      config_info              = "ivx_gas_dev.fw_conf_gas_db.tbl_config_info"
      data_pipeline_status_log = "ivx_gas_dev.fw_conf_gas_db.tbl_data_pipeline_status_log"
      schm_sync_log            = "ivx_gas_dev.fw_conf_gas_db.tbl_schm_sync_log"
    }
    dashboards = [
      { title = "DPZ InnovestX FW4", dashboard_type = "fw4_dashboard" },
      { title = "DPZ InnovestX FW4 Log", dashboard_type = "fw4_log_dashboard" },
      { title = "DPZ InnovestX Schema Sync", dashboard_type = "dpz_schema_sync" }
    ]
  }

  # Monoline
  AutoX_MDZ = {
    tables = {
      config_info              = "atx_dev.fw_conf_cmmn_db.tbl_config_info"
      data_pipeline_status_log = "atx_dev.fw_conf_cmmn_db.tbl_data_pipeline_status_log"
      file_trnf_area_log       = "atx_dev.fw_conf_cmmn_db.tbl_file_trnf_area_log"
      file_trnf_job_log        = "atx_dev.fw_conf_cmmn_db.tbl_file_trnf_job_log"
    }
    dashboards = [
      { title = "MDZ AutoX FW4", dashboard_type = "fw4_atx_dashboard" },
      { title = "MDZ AutoX FW4 Log", dashboard_type = "fw4_log_dashboard" }
    ]
  }
  SCBPT_MDZ = {
    tables = {
      config_info              = "scbpt_mdz_dev.fw_conf_cmmn_db.tbl_config_info"
      data_pipeline_status_log = "scbpt_mdz_dev.fw_conf_cmmn_db.tbl_data_pipeline_status_log"
    }
    dashboards = [
      { title = "MDZ SCBPT FW4", dashboard_type = "fw4_dashboard" },
      { title = "MDZ SCBPT FW4 Log", dashboard_type = "fw4_log_dashboard" }
    ]
  }

  CardX_MDZ = {
    tables = {
      config_info              = "cdx_mdz_dev.fw_conf_cmmn_db.tbl_config_info"
      data_pipeline_status_log = "cdx_mdz_dev.fw_conf_cmmn_db.tbl_data_pipeline_status_log"
    }
    dashboards = [
      { title = "MDZ CardX FW4", dashboard_type = "fw4_dashboard" },
      { title = "MDZ CardX FW4 Log", dashboard_type = "fw4_log_dashboard" }
    ]
  }
  TokenX_MDZ = {
    tables = {
      config_info              = "tkx_mdz_dev.fw_conf_cmmn_db.tbl_config_info"
      data_pipeline_status_log = "tkx_mdz_dev.fw_conf_cmmn_db.tbl_data_pipeline_status_log"
    }
    dashboards = [
      { title = "MDZ TokenX FW4", dashboard_type = "fw4_dashboard" },
      { title = "MDZ TokenX FW4 Log", dashboard_type = "fw4_log_dashboard" }
    ]
  }
}

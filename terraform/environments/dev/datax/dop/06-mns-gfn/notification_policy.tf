
# "Pagerduty_AutoX_GAS_Databricks_IP_DP_NP_01"
# "Pagerduty_AutoX_MDZ_Databricks_IP_DP_NP_01"
# "Pagerduty_CardX_GAS_Databricks_IP_DP_NP_01"
# "Pagerduty_CardX_MDZ_Kafka_Dev"
# "Pagerduty_CardX_RDT_Databricks_IP_DP_NP_01"
# "Pagerduty_DataX_C360PD_Databricks_IP_DP_NP_01"
# "Pagerduty_DataX_C360_Databricks_IP_DP_NP_01"
# "Pagerduty_DataX_CUST_Databricks_IP_DP_NP_01"
# "Pagerduty_DataX_MGMT_Databricks_IP_NP_01"
# "Pagerduty_DataX_SEC_Databricks_IP_DP_NP_01"
locals {
  policy = [
    {
      contact_point = "Pagerduty_AutoX_GAS_Databricks_IP_DP_NP_01"
      label_matcher = ["BusinessService=AutoX_GAS", "Severity=Critical", "Team=Platform"]
      group_by      = ["BusinessService", "Severity", "Team"]
    },
    {
      contact_point = "Pagerduty_AutoX_MDZ_Databricks_IP_DP_NP_01"
      label_matcher = ["BusinessService=AutoX_MDZ", "Severity=Critical", "Team=Platform"]
      group_by      = ["BusinessService", "Severity", "Team"]
    },
    {
      contact_point = "Pagerduty_CardX_GAS_Databricks_IP_DP_NP_01"
      label_matcher = ["BusinessService=CardX_GAS", "Severity=Critical", "Team=Platform"]
      group_by      = ["BusinessService", "Severity", "Team"]
    },
    {
      contact_point = "Pagerduty_CardX_MDZ_Kafka_Dev"
      label_matcher = ["BusinessService=CardX_MDZ", "Severity=Error", "Team=Platform"]
      group_by      = ["BusinessService", "Severity", "Team"]
    },
    {
      contact_point = "Pagerduty_CardX_RDT_Databricks_IP_DP_NP_01"
      label_matcher = ["BusinessService=CardX_RDT", "Severity=Critical", "Team=Platform"]
      group_by      = ["BusinessService", "Severity", "Team"]
    },
    {
      contact_point = "Pagerduty_DataX_C360PD_Databricks_IP_DP_NP_01"
      label_matcher = ["BusinessService=DataX_C360PD", "Severity=Critical", "Team=Platform"]
      group_by      = ["BusinessService", "Severity", "Team"]
    },
    {
      contact_point = "Pagerduty_DataX_C360_Databricks_IP_DP_NP_01"
      label_matcher = ["BusinessService=DataX_C360", "Severity=Critical", "Team=Platform"]
      group_by      = ["BusinessService", "Severity", "Team"]
    },
    {
      contact_point = "Pagerduty_DataX_CUST_Databricks_IP_DP_NP_01"
      label_matcher = ["BusinessService=DataX_CUST", "Severity=Critical", "Team=Platform"]
      group_by      = ["BusinessService", "Severity", "Team"]
    },
    {
      contact_point = "Pagerduty_DataX_MGMT_Databricks_IP_NP_01"
      label_matcher = ["BusinessService=DataX_MGMT", "Severity=Critical", "Team=Platform"]
      group_by      = ["BusinessService", "Severity", "Team"]
    },
    {
      contact_point = "Pagerduty_DataX_SEC_Databricks_IP_DP_NP_01"
      label_matcher = ["BusinessService=DataX_SEC", "Severity=Critical", "Team=Platform"]
      group_by      = ["BusinessService", "Severity", "Team"]
    },
    {
      contact_point = "Pagerduty_DataX_WEBAUTH_Databricks_IP_NP_01"
      label_matcher = ["BusinessService=DataX_WEBAUTH", "Severity=Critical", "Team=Platform"]
    },
    {
      contact_point = "Pagerduty_SCBPT_MDZ_Databricks_IP_DP_NP_01"
      label_matcher = ["BusinessService=SCBPT_MDZ", "Severity=Critical", "Team=Platform"]
    },
    {
      contact_point = "DataX_test_alert_grafana_kuroro"
      label_matcher = ["Team=Platform", "BusinessService=DataX_expires", "alertname=Account_expires_date"]
      group_by      = ["BusinessService", "Team", "app_registration_name"]
    }
  ]
}

resource "grafana_notification_policy" "org_notification_policy" {
  org_id        = 1
  contact_point = "test-MS_Teams"
  group_by      = ["grafana_folder", "alertname"]

  disable_provenance = true

  group_wait      = "1m"
  group_interval  = "5m"
  repeat_interval = "3h"

  dynamic "policy" {
    for_each = local.policy
    content {
      dynamic "matcher" {
        for_each = policy.value.label_matcher
        content {
          label = split("=", matcher.value)[0]
          match = "="
          value = split("=", matcher.value)[1]
        }
      }
      group_wait      = try(policy.value.group_wait, null)
      group_interval  = try(policy.value.group_interval, null)
      repeat_interval = try(policy.value.repeat_interval, null)

      contact_point = policy.value.contact_point
      group_by      = try(policy.value.group_by, null)
    }
  }
}



# "Pagerduty_AutoX_GAS_Databricks_IP_DP_NP_01"
# "Pagerduty_AutoX_MDZ_Databricks_IP_DP_NP_01"
# "Pagerduty_CardX_GAS_Databricks_IP_DP_NP_01"
# "Pagerduty_CardX_MDZ_Kafka_Dev"
# "Pagerduty_CardX_RDT_Databricks_IP_DP_NP_01"
# "Pagerduty_DataX_C360PD_Databricks_IP_DP_NP_01"
# "Pagerduty_DataX_C360_Databricks_IP_DP_NP_01"
# "Pagerduty_DataX_CUST_Databricks_IP_DP_NP_01"
# "Pagerduty_DataX_MGMT_Databricks_IP_NP_01"
# "Pagerduty_DataX_SEC_Databricks_IP_DP_NP_01"
# "Paweenruk-Test"
# "email receiver"
# "test-MS_Teams"

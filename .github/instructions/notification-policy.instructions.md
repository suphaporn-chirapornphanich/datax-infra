---
applyTo: "terraform/environments/prd/datax/dop/06-mns-gfn/notification_policy.tf"
---

# Grafana Notification Policy Guidelines

## Databricks Job Notification Policies

When configuring notification policies for Databricks Jobs, the following practices are acceptable:

### Group By Fields

For Databricks Job alerts, you may use multiple grouping fields based on the specific monitoring requirements. Using detailed grouping fields can provide granular control over alert routing and tracking.

**Example with comprehensive grouping:**
```hcl
group_by = ["area_id", "area_name", "job_id", "job_status", "job_name", "error", 
            "error_type", "freq", "schedule", "dl_data_dt", "job_start_time", 
            "job_type", "workspace_name", "workspace_id"]
```

**Considerations:**
- Multiple fields allow for detailed tracking and categorization of alerts
- Choose grouping fields based on your specific alerting and tracking needs
- More fields provide granular control but may result in more individual alert groups

### Repeat Interval

When using long repeat intervals (like 30 years) to effectively disable repeat notifications, add an explanatory comment:

```hcl
# Using a 30-year repeat interval to effectively disable repeat notifications for this policy
repeat_interval = "30y"
```

This makes the design choice explicit and helps future maintainers understand the intent.

## Summary

- Choose `group_by` fields based on your monitoring and alerting requirements
- Document unusual configuration values (like 30y repeat intervals) with clear comments
- Balance between alert detail and aggregation based on operational needs

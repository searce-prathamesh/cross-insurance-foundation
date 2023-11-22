resource "google_compute_security_policy" "policy" {
  name    = var.policy_name
  count   = length(var.cloud_armor_project_id)
  project = var.cloud_armor_project_id[count.index]
  adaptive_protection_config {
    layer_7_ddos_defense_config {
      rule_visibility = var.layer_7_ddos_rule_visibility
      enable          = var.layer_7_ddos_defense_config
    }
  }

  dynamic "rule" {
    for_each = var.default_rules
    content {
      action   = rule.value.action
      priority = rule.value.priority
      match {
        versioned_expr = rule.value.versioned_expr
        config {
          src_ip_ranges = rule.value.src_ip_ranges
        }
      }
    }
  }
  dynamic "rule" {
    for_each = var.owasp_rules
    content {
      preview  = var.preview_mode
      action   = rule.value.action
      priority = rule.value.priority
      match {
        expr {
          expression = rule.value.expression
        }
      }
    }
  }


  dynamic "rule" {
    for_each = var.rate_limit
    content {
      action   = rule.value.action
      preview  = var.preview_mode
      priority = rule.value.priority
      match {
        versioned_expr = rule.value.versioned_expr
        config {
          src_ip_ranges = rule.value.src_ip_ranges
        }
      }
      rate_limit_options {
        conform_action = rule.value.rate_limit_conform_action
        exceed_action  = rule.value.rate_limit_exceed_action
        enforce_on_key = rule.value.rate_limit_enforce_on_key
        rate_limit_threshold {
          count        = rule.value.rate_limit_threshold_count
          interval_sec = rule.value.rate_limit_interval_sec
        }
      }
    }
  }
}


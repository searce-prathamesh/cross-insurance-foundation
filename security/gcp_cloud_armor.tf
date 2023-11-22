/* module "cloud_armor_default_rules" {
  source                 = "./terraform-modules/gcp_cloud_armor"
  policy_name            = "${local.prefix}-policy"
  cloud_armor_project_id = local.cloud_armor_project_id
  preview_mode           = true

  #Adaptive Protection Config
  layer_7_ddos_defense_config  = true
  layer_7_ddos_rule_visibility = "STANDARD"

  default_rules = {
    allowed_ip = {

      action         = "allow"
      priority       = "2147483647"
      versioned_expr = "SRC_IPS_V1"
      src_ip_ranges  = ["*"]
      description = "SQL Injection"
    }
    blocked_IP = {
      action         = "deny(403)"
      priority       = "50000"
      versioned_expr = "SRC_IPS_V1"
      description = "SQL Injection"
      src_ip_ranges  = ["10.10.10.10/32"] # List of CIDR ranges which will be denied, Please use tfvar to pass the value
    }
  }

  # ################################################################################################
  # #Advanced Rules

  owasp_rules = {

    rule_sql-injection = {

      action      = "deny(403)"
      priority    = "5000"
      expression  = "evaluatePreconfiguredWaf('sqli-${local.crs_version}${local.relase_type}',{'sensitivity': ${local.sensitivity_level}})"
      description = "SQL Injection"
    }

    rule_xss = {

      action      = "deny(403)"
      priority    = "5020"
      expression  = "evaluatePreconfiguredWaf('xss-${local.crs_version}${local.relase_type}',{'sensitivity': ${local.sensitivity_level}})"
      description = "Cross Site Scripting (XSS) Injection"
    }

    rule_lfi = {

      action      = "deny(403)"
      priority    = "5040"
      expression  = "evaluatePreconfiguredWaf('lfi-${local.crs_version}${local.relase_type}',{'sensitivity': ${local.sensitivity_level}})"
      description = "Local file inclusion (LFI)"
    }
    rule_rfi = {

      action      = "deny(403)"
      priority    = "5060"
      expression  = "evaluatePreconfiguredWaf('rfi-${local.crs_version}${local.relase_type}',{'sensitivity': ${local.sensitivity_level}})"
      description = "Remote file inclusion (RFI)"
    }
    rule_rce = {

      action      = "deny(403)"
      priority    = "5080"
      expression  = "evaluatePreconfiguredWaf('rce-${local.crs_version}${local.relase_type}',{'sensitivity': ${local.sensitivity_level}})"
      description = "Remote Code Execution (rce)"
    }
    rule_method_enforcement = {

      action      = "deny(403)"
      priority    = "5100"
      expression  = "evaluatePreconfiguredWaf('methodenforcement-${local.crs_version}${local.relase_type}',{'sensitivity': ${local.sensitivity_level}})"
      description = "method enforcement Rule"
    }
    rule_scanner_detection = {

      action      = "deny(403)"
      priority    = "5120"
      expression  = "evaluatePreconfiguredWaf('scannerdetection-${local.crs_version}${local.relase_type}',{'sensitivity': ${local.sensitivity_level}})"
      description = "scanner detection Rule"
    }
    rule_protocol_attack = {

      action      = "deny(403)"
      priority    = "5140"
      expression  = "evaluatePreconfiguredWaf('protocolattack-${local.crs_version}${local.relase_type}',{'sensitivity': ${local.sensitivity_level}})"
      description = "Protocol attack Rule"
    }
    rule_php_injection_attack = {

      action      = "deny(403)"
      priority    = "5160"
      expression  = "evaluatePreconfiguredWaf('php-${local.crs_version}${local.relase_type}',{'sensitivity': ${local.sensitivity_level}})"
      description = "PHP injection attack Rule"
    }
    rule_session_fixation_attack = {

      action      = "deny(403)"
      priority    = "5180"
      expression  = "evaluatePreconfiguredWaf('sessionfixation-${local.crs_version}${local.relase_type}',{'sensitivity': ${local.sensitivity_level}})"
      description = "Session fixation attack Rule"
    }
    rule_java_attack = {

      action      = "deny(403)"
      priority    = "5200"
      expression  = "evaluatePreconfiguredWaf('java-${local.crs_version}${local.relase_type}',{'sensitivity': ${local.sensitivity_level}})"
      description = "Java attack Rule"
    }
    rule_nodejs_attack = {

      action      = "deny(403)"
      priority    = "5220"
      expression  = "evaluatePreconfiguredWaf('nodejs-${local.crs_version}${local.relase_type}',{'sensitivity': ${local.sensitivity_level}})"
      description = "NodeJS attack Rule"
    }
    rule_cve = {

      action      = "deny(403)"
      priority    = "5240"
      expression  = "evaluatePreconfiguredWaf('cve-canary',{'sensitivity': ${local.sensitivity_level}})"
      description = "CVE Canary Rule"
    }

    ###################################### Geo-based location ################################

    rule_geo_based = {

      action      = "deny(403)"
      priority    = "5260"
      expression  = "origin.region_code ==  'CN' "
      description = "Please enter the country digit  code which you want block. Example : AU"

    }
  }


  #---------------------------------------------------------------------------------------------------
  #Rate Limit Configuration
  rate_limit = {
    rate_limit_config = {
      preview                    = true
      action                     = "throttle"
      priority                   = "5280"
      versioned_expr             = "SRC_IPS_V1"
      src_ip_ranges              = ["*"]
      rate_limit_conform_action  = "allow"
      rate_limit_exceed_action   = "deny(502)" # Error code to be displaed if the threshold breached.
      rate_limit_enforce_on_key  = "ALL"
      rate_limit_threshold_count = "200" #Number of connections from a IP
      rate_limit_interval_sec    = "300" #Threshold of Seconds
      description = "SQL Injection"
    }
  }
} */

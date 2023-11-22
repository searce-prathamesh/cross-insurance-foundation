
variable "policy_name" {
  type        = string
  default     = ""
  description = "Cloud Armor policy name"
}

variable "default_rules" {
  type = map(object({
    action         = string
    priority       = string
    versioned_expr = string
    src_ip_ranges  = list(string)
    description    = string
    })
  )
}

variable "owasp_rules" {
  type = map(object({
    action      = string
    priority    = string
    expression  = string
    description = string
    }
    )
  )
}

variable "cloud_armor_project_id" {
  type = list(string)

}

variable "rate_limit" {
  type = map(object({
    action                     = string
    preview                    = bool
    priority                   = string
    versioned_expr             = string
    src_ip_ranges              = list(string)
    rate_limit_conform_action  = string
    rate_limit_exceed_action   = string
    rate_limit_enforce_on_key  = string
    rate_limit_threshold_count = string
    rate_limit_interval_sec    = string
    description                = string
    }
    )
  )
}

variable "layer_7_ddos_defense_config" {
  type = bool

}

variable "layer_7_ddos_rule_visibility" {
  type        = string
  description = "can be a string like STANDARD or PREMIUM"
}

variable "preview_mode" {
  type        = bool
  description = "When set to true, the action specified above is not enforced. Stackdriver logs for requests that trigger a preview action are annotated as such."
  default     = true
}
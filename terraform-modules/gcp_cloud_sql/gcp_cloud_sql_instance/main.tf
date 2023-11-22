resource "google_sql_database_instance" "instance" {
  provider            = google-beta
  project             = var.project
  name                = var.name
  region              = var.region
  database_version    = var.database_version
  deletion_protection = var.deletion_protection
  root_password       = data.sql_root_secret.id

  settings {
    tier              = var.tier
    disk_type         = var.disk_type
    disk_size         = var.disk_size
    disk_autoresize   = var.disk_autoresize
    user_labels       = var.user_labels
    availability_type = var.availability_type

    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = "projects/${var.project}/global/networks/${var.network}"
      enable_private_path_for_google_cloud_services = true
    }

    insights_config {
      query_insights_enabled  = var.query_insights_enabled
      query_string_length     = var.query_string_length
      record_application_tags = var.record_application_tags
      record_client_address   = var.record_client_address
      query_plans_per_minute  = var.query_plans_per_minute
    }

    backup_configuration {
      binary_log_enabled             = var.binary_log_enabled
      enabled                        = true
      start_time                     = var.backup_window
      transaction_log_retention_days = var.backup_retention_days
      location                       = var.primary_region
      point_in_time_recovery_enabled = var.point_in_time_recovery_enabled

    }

    maintenance_window {
      day  = var.maintenance_window.day  # "1"  # That is Monday (1-7)
      hour = var.maintenance_window.hour #"12" # 12 PM UTC
    }

  }

}
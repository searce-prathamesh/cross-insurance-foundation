data "google_secret_manager_secret" "sql_root_secret" {
  project   = var.project
  secret_id = var.cloud_sql_root_secret_id
}
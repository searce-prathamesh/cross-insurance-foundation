variable "project" {
  type        = string
  default     = ""
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
}

variable "name" {
  type        = string
  default     = "cloud-sql-instance-01"
  description = "The name of the database in the Cloud SQL instance. This does not include the project ID or instance name."
}

variable "region" {
  type        = string
  default     = "asia-southeast2"
  description = "The region the instance will sit in. If a region is not provided in the resource definition, the provider region will be used instead."
}

variable "database_version" {
  type        = string
  default     = "MYSQL_5_6"
  description = "The MySQL, PostgreSQL or SQL Server version to use. Supported values include MYSQL_5_6, MYSQL_5_7, MYSQL_8_0, POSTGRES_9_6,POSTGRES_10, POSTGRES_11, POSTGRES_12, POSTGRES_13, POSTGRES_14, POSTGRES_15, SQLSERVER_2017_STANDARD, SQLSERVER_2017_ENTERPRISE, SQLSERVER_2017_EXPRESS, SQLSERVER_2017_WEB. SQLSERVER_2019_STANDARD, SQLSERVER_2019_ENTERPRISE, SQLSERVER_2019_EXPRESS, SQLSERVER_2019_WEB. Database Version Policies includes an up-to-date reference of supported versions."
}

variable "deletion_protection" {
  type        = bool
  default     = false
  description = "Whether or not to allow Terraform to destroy the instance. Unless this field is set to false in Terraform state, a terraform destroy or terraform apply command that deletes the instance will fail. Defaults to true."
}

variable "tier" {
  type        = string
  default     = "db-custom-2-13312"
  description = "The machine type to use. See tiers for more details and supported versions. Postgres supports only shared-core machine types, and custom machine types such as db-custom-2-13312. See the Custom Machine Type Documentation to learn about specifying custom machine types."
}

variable "disk_type" {
  type        = string
  default     = "PD_HDD"
  description = "The type of data disk: PD_SSD or PD_HDD. Defaults to PD_SSD."
}

variable "disk_size" {
  type        = string
  default     = "10"
  description = "The size of data disk, in GB. Size of a running instance cannot be reduced but can be increased. The minimum value is 10GB."
}

variable "disk_autoresize" {
  type        = bool
  default     = true
  description = "Enables auto-resizing of the storage size. Defaults to true."
}

variable "user_labels" {
  type        = map(any)
  default     = map(string)
  description = "A set of key/value user label pairs to assign to the instance."
}

variable "availability_type" {
  type        = string
  default     = "ZONAL"
  description = "(Optional) The availability type of the Cloud SQL instance, high availability (REGIONAL) or single zone (ZONAL)"
}

variable "network" {
  type        = string
  default     = "ayo-shared-vpc-01"
  description = "The VPC network to which this clous SQL will be connected to"
}

variable "query_insights_enabled" {
  type        = bool
  default     = false
  description = "True if Query Insights feature is enabled."
}

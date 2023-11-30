variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
}

variable "account_id" {
  description = "The service account ID. Changing this forces a new service account to be created."
}
variable "display_name" {
  description = "The service account display name. Changing this forces a new service account to be created."
}

variable "description" {
  description = "The display name for the service account. Can be updated without creating a new resource."
  default     = ""
}
variable "generate_keys" {
  description = "The display name for the service account. Can be updated without creating a new resource."
  default     = ""
}

variable "project_roles" {
  description = "The display name for the service account. Can be updated without creating a new resource."
  default     = "managed-by-terraform"
}

variable "roles" {
  type        = list(string)
  description = "The roles that will be granted to the service account."
  default     = []
}
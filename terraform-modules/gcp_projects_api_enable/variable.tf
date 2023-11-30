# variable "name" {
#   type        = string
#   default     = "demo-project"
#   description = "Name of the Project"
# }


# variable "folder_id" {
#   type        = string
#   default     = "demo-folders"
#   description = "Name of the Folder ID "
# }

# variable "billing_account" {
#   type        = string
#   default     = "123456"
#   description = "Billing account ID "
# }

# variable "enable_host_project" {
#   type        = bool
#   default     = false
#   description = "Make true for enabeling host project."
# }

variable "api_list" {
  description = "The list of apis to activate within the project"
  type        = list(string)
  default     = ["compute.googleapis.com"]
}

variable "project_id" {
  type        = string
  default     = "demo-project"
  description = "Name of the Project ID "
}

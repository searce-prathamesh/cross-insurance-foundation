variable "project" {
  type        = string
  default     = "admin-01"
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
}

variable "region" {
  type        = string
  default     = "europe-west4"
  description = "The GCP region for this subnetwork."
}

variable "subnetwork" {
  type        = string
  default     = "test-subnet"
  description = "The subnet for this VPC network."
}

variable "members" {
  type        = list(string)
  default     = ["user:example@test.com", "user:example2@test.com"]
  description = "The members email ID"
}

variable "role" {
  type        = list(string)
  default     = ["roles/compute.networkUser", "roles/compute.networkAdmin"]
  description = "The members roles"
}
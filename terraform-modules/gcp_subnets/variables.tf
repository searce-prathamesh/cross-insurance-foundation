variable "name" {
  type        = string
  default     = "dev-subnet-01"
  description = "The name of the resource, provided by the client when initially creating the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash."
}

variable "ip_cidr_range" {
  type        = string
  default     = ""
  description = "The range of internal addresses that are owned by this subnetwork. Provide this property when you create the subnetwork. For example, 10.0.0.0/8 or 192.168.0.0/16. Ranges must be unique and non-overlapping within a network. Only IPv4 is supported."
}

variable "region" {
  type        = string
  default     = "us-central-1"
  description = "The GCP region for this subnetwork."
}

variable "network" {
  type        = string
  default     = "demo-shared"
  description = "The network this subnet belongs to. Only networks that are in the distributed mode can have subnetworks."
}

variable "project" {
  type        = string
  default     = ""
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
}

variable "private_ip_google_access" {
 type        = bool
 default     = true
 description = "When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access."
}

variable "secondary_ip_range" {
 description = "The secondary IP ranges for POD and services"
}
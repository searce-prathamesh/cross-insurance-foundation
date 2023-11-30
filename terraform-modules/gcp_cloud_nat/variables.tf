variable "cloud_router_name" {
  type        = string
  description = "Name of the router"
}

variable "cloud_router_network_name" {
  type        = string
  description = "A reference to the network to which this router belongs"
}

variable "project" {
  type        = string
  description = "The project ID to deploy to"
}

variable "region" {
  type        = string
  description = "Region where the router resides"
}

variable "cloud_router_bgp_asn" {
  type        = number
  default     = 64512
  description = "The ASN number for the GCP router"
}

variable "external_ip_count" {
  type        = number
  default     = 1
  description = "Number of External Ips to be reserved"
}

variable "external_ip_name" {
  type        = string
  default     = "cloud-nat-external-pub-static-ip"
  description = "The External Public IP address name which need to be reserved for NAT"
}

variable "cloud_nat_name" {
  type        = string
  default     = "cloud-nat"
  description = "Name of the Cloud NAT"
}

variable "subnet_name" {
  type        = string
  default     = ""
  description = "Name of the Subnet"
}

variable "ext_ip_name" {
  type        = string
  default     = ""
  description = "The Name of the External IPs which need to be reserved"
}

variable "address" {
  type        = string
  default     = ""
  description = "Type of Address"
}

variable "min_ports_per_vm" {
  type        = number
  default     = 2
  description = "Type of Address"
}

variable "enable_nat_logs" {
  type        = bool
  default     = false
  description = "Need to enable NAT loggs or now, can be true ot false"
}
variable "project" {
  type        = string
  default     = "ayoconnect-central-network"
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
}

variable "name" {
  type        = string
  default     = "ayo-shared-vpc-01"
  description = "Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035."
}

variable "auto_create_subnetworks" {
  type        = bool
  default     = false
  description = "When set to true, the network is created in \"auto subnet mode\" and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in \"custom subnet mode\" so the user can explicitly connect subnetwork resources."
}

variable "mtu" {
  type        = number
  default     = 1500
  description = "Maximum Transmission Unit in bytes. The default value is 1460 bytes. The minimum value for this field is 1300 and the maximum value is 8896 bytes (jumbo frames)."

}

variable "routing_mode" {
  type        = string
  default     = "REGIONAL"
  description = "The network-wide routing mode to use. If set to REGIONAL, this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router. If set to GLOBAL, this network's cloud routers will advertise routes with all subnetworks of this network, across regions. Possible values are: REGIONAL, GLOBAL."
}

variable "delete_default_routes_on_create" {
  type        = bool
  default     = false
  description = "If set to true, default routes (0.0.0.0/0) will be deleted immediately after network creation. Defaults to false."
}

variable "service_project_list" {
  type        = list(string)
  default     = [""]
  description = "List of service Projects IDs which need be attached to the host project"
}



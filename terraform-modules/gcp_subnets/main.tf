/******************************************
	Subnet configuration
 *****************************************/
resource "google_compute_subnetwork" "subnetwork" {
  name                     = var.name
  ip_cidr_range            = var.ip_cidr_range
  region                   = var.region
  network                  = var.network
  project                  = var.project
  private_ip_google_access = var.private_ip_google_access
  secondary_ip_range       = var.secondary_ip_range
}


#Reserving External IP
resource "google_compute_address" "ext_ip_address" {
  count        = var.external_ip_count
  project      = var.project
  name         = "${var.external_ip_name}-${count.index}"
  address_type = "EXTERNAL"
  ip_version   = "IPV4"
  region       = var.region
}

#Cloud Router
resource "google_compute_router" "cloud_router" {
  project = var.project
  name    = var.cloud_router_name
  region  = var.region
  network = var.cloud_router_network_name

  bgp {
    asn = var.cloud_router_bgp_asn
  }
}

#Cloud NAT
resource "google_compute_router_nat" "nat_manual" {
  project          = var.project
  name             = var.cloud_nat_name
  router           = google_compute_router.cloud_router.name
  region           = google_compute_router.cloud_router.region
  min_ports_per_vm = var.min_ports_per_vm


  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips                = google_compute_address.ext_ip_address.*.self_link


  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"


  log_config {
    enable = var.enable_nat_logs
    filter = "ERRORS_ONLY"
  }

  depends_on = [google_compute_address.ext_ip_address]
}
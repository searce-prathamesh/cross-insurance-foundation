/******************************************
	VPC
 *****************************************/
resource "google_compute_network" "shared_vpc_network" {
  project                         = var.project
  name                            = var.name
  auto_create_subnetworks         = var.auto_create_subnetworks
  mtu                             = var.mtu
  routing_mode                    = var.routing_mode
  delete_default_routes_on_create = var.delete_default_routes_on_create
}


/******************************************
	Shared VPC Host Project
 *****************************************/
resource "google_compute_shared_vpc_host_project" "shared_vpc_host" {
  provider = google-beta
  project  = var.project

  depends_on = [google_compute_network.shared_vpc_network]
}


/******************************************
	Service Project Attachment
 *****************************************/
resource "google_compute_shared_vpc_service_project" "service_project_attahment" {
  host_project    = var.project
  count           = length(var.service_project_list)
  service_project = var.service_project_list[count.index]

  depends_on = [google_compute_shared_vpc_host_project.shared_vpc_host]
}
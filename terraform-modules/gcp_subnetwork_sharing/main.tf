/******************************************
	Subnet sharing configuration
 *****************************************/
resource "google_compute_subnetwork_iam_binding" "subnetwork_sharing" {
  count      = length(var.role)
  project    = var.project
  region     = var.region
  subnetwork = var.subnetwork
  role       = var.role[count.index]
  members     = var.members
}
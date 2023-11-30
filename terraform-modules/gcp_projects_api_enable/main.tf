
# resource "google_project" "my_project" {
#   name              = var.name
#   project_id        = var.project_id
#   folder_id         = var.folder_id
# #  org_id            = var.org_id
#   billing_account   = var.billing_account
 
# }

# resource "google_compute_shared_vpc_host_project" "shared_vpc_host" {
#   count    = var.enable_host_project ? 1 : 0
#   provider = google-beta
#   project  = google_project.my_project.name

#   depends_on = [google_project.my_project,google_project_service.service]
# }


resource "google_project_service" "service" {
  for_each = toset(var.api_list)  # Convert the list to a set
  project  = var.project_id
  service = each.key
  disable_dependent_services = true
}
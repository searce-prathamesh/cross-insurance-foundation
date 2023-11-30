
resource "google_folder" "folders" {

  display_name = var.names
  parent       = var.parent
}


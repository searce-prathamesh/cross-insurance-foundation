#Base Provider configuration
provider "google" {
  region      = "europe-west1"
  credentials = file("./sa/sa.json") # gcp service account json key config for terraform
}

#Google Beta provider
provider "google-beta" {
  credentials = file("./sa/sa.json")
}

# Kubernetes Provider
provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

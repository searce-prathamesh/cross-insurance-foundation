#Base Provider configuration
provider "google" {
  region = "europe-west1"
  #credentials = file("./sa/sa.json") # gcp service account json key config for terraform
}

#Google Beta provider
provider "google-beta" {
  #credentials = file("./sa/sa.json")
}



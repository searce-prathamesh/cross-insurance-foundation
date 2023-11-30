
################
# Projects env
################
module "shared_Project" {
  source              = "../terraform-modules/gcp_projects_api_enable"
  project_id          = "terraform-foundation-modules"
  api_list = [
    "compute.googleapis.com",
    "iam.googleapis.com",
    "stackdriver.googleapis.com",
    "monitoring.googleapis.com",
    "logging.googleapis.com",
    "iamcredentials.googleapis.com",
    "osconfig.googleapis.com",
    "networkmanagement.googleapis.com"

  ]
}


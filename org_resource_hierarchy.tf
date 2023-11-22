module "parent_folder" {
  source = "./terraform-modules/gcp_folders"

  names  = ["demo-shared"]
  parent = local.parent
}


module "gcp_projects" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name                    = "dev-sp-01"
  project_id              = "dev-sp-01"
  org_id                  = local.parent
  folder_id               = "demo-shared"
  billing_account         = local.billing_account
  random_project_id       = false
  default_service_account = "deprivilege"
  activate_apis = [
    "compute.googleapis.com",
    "iam.googleapis.com",
    "stackdriver.googleapis.com",
    "monitoring.googleapis.com",
    "logging.googleapis.com",
    "iamcredentials.googleapis.com",
    "osconfig.googleapis.com",
    "networkmanagement.googleapis.com"

  ]

  labels = {
    env = "dev"
  }
  depends_on = [
    module.parent_folder
  ]
}

module "gcp_projects" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name                    = "prod-sp-01"
  project_id              = "prod-sp-01"
  org_id                  = local.parent
  folder_id               = "demo-shared"
  billing_account         = local.billing_account
  random_project_id       = false
  default_service_account = "deprivilege"
  activate_apis = [
    "compute.googleapis.com",
    "iam.googleapis.com",
    "stackdriver.googleapis.com",
    "monitoring.googleapis.com",
    "logging.googleapis.com",
    "iamcredentials.googleapis.com",
    "osconfig.googleapis.com",
    "networkmanagement.googleapis.com"

  ]

  labels = {
    env = "prod"
  }
  depends_on = [
    module.parent_folder
  ]
}
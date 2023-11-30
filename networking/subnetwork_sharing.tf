module "dev_subnetwork_sharing-01" {
  source     = "../terraform-modules/gcp_subnetwork_sharing"
  project    = local.central_network_project_id
  region     = local.primary_region
  subnetwork = module.dev-subnet-01.name
  role       = ["roles/compute.networkUser"]
  members    = ["user:prathamesh.tibile@searce.com"]
  depends_on = [module.dev-subnet-01]
}

module "prod_subnetwork_sharing-02" {
  source     = "../terraform-modules/gcp_subnetwork_sharing"
  project    = local.central_network_project_id
  region     = local.primary_region
  subnetwork = module.prod-subnet-01.name
  role       = ["roles/compute.networkUser"]
  members    = ["user:prathamesh.tibile@searce.com"]
  depends_on = [module.prod-subnet-01]
}

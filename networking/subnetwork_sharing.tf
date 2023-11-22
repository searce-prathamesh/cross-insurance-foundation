module "sandbox_subnetwork_sharing-01" {
  source     = "./terraform-modules/gcp_subnetwork_sharing"
  project    = local.central_network_project_id
  region     = local.primary_region
  subnetwork = module.sandbox-subnet-01.name
  role       = ["roles/compute.networkUser"]
  members    = ["serviceAccount:991938799169@cloudservices.gserviceaccount.com", "user:shubham.pandit@searce.com"]
  depends_on = [module.sandbox-subnet-01]
}

module "sandbox_subnetwork_sharing-02" {
  source     = "./terraform-modules/gcp_subnetwork_sharing"
  project    = local.central_network_project_id
  region     = local.primary_region
  subnetwork = module.sandbox-subnet-02.name
  role       = ["roles/compute.networkUser"]
  members    = ["serviceAccount:991938799169@cloudservices.gserviceaccount.com", "user:shubham.pandit@searce.com"]
  depends_on = [module.sandbox-subnet-02]
}

module "staging-subnetwork_sharing-01" {
  source     = "./terraform-modules/gcp_subnetwork_sharing"
  project    = local.central_network_project_id
  region     = local.primary_region
  subnetwork = module.staging-subnet-01.name
  role       = ["roles/compute.networkUser"]
  members    = ["serviceAccount:991938799169@cloudservices.gserviceaccount.com", "user:shubham.pandit@searce.com"]
  depends_on = [module.staging-subnet-01]
}

module "staging-subnetwork_sharing-02" {
  source     = "./terraform-modules/gcp_subnetwork_sharing"
  project    = local.central_network_project_id
  region     = local.primary_region
  subnetwork = module.staging-subnet-02.name
  role       = ["roles/compute.networkUser"]
  members    = ["serviceAccount:991938799169@cloudservices.gserviceaccount.com", "user:shubham.pandit@searce.com"]
  depends_on = [module.staging-subnet-01]
}

module "feature-subnetwork_sharing-01" {
  source     = "./terraform-modules/gcp_subnetwork_sharing"
  project    = local.central_network_project_id
  region     = local.primary_region
  subnetwork = module.feature-subnet-01.name
  role       = ["roles/compute.networkUser"]
  members    = ["serviceAccount:991938799169@cloudservices.gserviceaccount.com", "user:shubham.pandit@searce.com"]
  depends_on = [module.feature-subnet-01]
}

module "feature-subnetwork_sharing-02" {
  source     = "./terraform-modules/gcp_subnetwork_sharing"
  project    = local.central_network_project_id
  region     = local.primary_region
  subnetwork = module.feature-subnet-02.name
  role       = ["roles/compute.networkUser"]
  members    = ["serviceAccount:991938799169@cloudservices.gserviceaccount.com", "user:shubham.pandit@searce.com"]
  depends_on = [module.feature-subnet-01]
}

module "prod-subnetwork_sharing-01" {
  source     = "./terraform-modules/gcp_subnetwork_sharing"
  project    = local.central_network_project_id
  region     = local.primary_region
  subnetwork = module.prod-subnet-01.name
  role       = ["roles/compute.networkUser"]
  members    = ["serviceAccount:991938799169@cloudservices.gserviceaccount.com", "user:shubham.pandit@searce.com"]
  depends_on = [module.prod-subnet-01]
}

module "prod-subnetwork_sharing-02" {
  source     = "./terraform-modules/gcp_subnetwork_sharing"
  project    = local.central_network_project_id
  region     = local.primary_region
  subnetwork = module.prod-subnet-02.name
  role       = ["roles/compute.networkUser"]
  members    = ["serviceAccount:991938799169@cloudservices.gserviceaccount.com", "user:shubham.pandit@searce.com"]
  depends_on = [module.prod-subnet-01]
}
module "central_shared_vpc_01" {
  source                          = "./terraform-modules/gcp_shared_vpc"
  project                         = local.central_network_project_id
  name                            = "${local.prefix}-shared-vpc-01"
  auto_create_subnetworks         = false
  mtu                             = 1500
  routing_mode                    = "REGIONAL"
  delete_default_routes_on_create = false

  #Service Projects List
  service_project_list = [
    "dev-sp-01",
    "prod-sp-01"

  ]
}

# dev Subnet 01
module "dev-subnet-01" {
  source = "./terraform-modules/gcp_subnets"

  name                     = "${local.prefix}-sandbox-subnet-01"
  ip_cidr_range            = "10.8.1.0/24"
  region                   = local.primary_region
  network                  = module.central_shared_vpc_01.id
  project                  = local.central_network_project_id
  private_ip_google_access = true

  depends_on = [module.dev-subnet-01]
}

# prod Subnet 01
module "prod-subnet-01" {
  source = "./terraform-modules/gcp_subnets"

  name                     = "${local.prefix}-prod-subnet-01"
  ip_cidr_range            = "10.8.4.0/24"
  region                   = local.primary_region
  network                  = module.central_shared_vpc_01.id
  project                  = local.central_network_project_id
  private_ip_google_access = true
}
/*
resource "google_compute_subnetwork_iam_member" "subnetwork_sharing" {
  project    = local.central_network_project_id
  region     = local.primary_region
  subnetwork = module.sandbox-subnet-01.name
  role       = "roles/compute.networkUser"
  member     = "serviceAccount:991938799169@cloudservices.gserviceaccount.com"

}
*/


module "gke" {
  source                  = "./terraform-modules/gcp_gke_private_cluster"
  project_id              = "terraform-foundation-modules"
  name                    = "gke-test-1"
  region                  = "europe-west4"
  zones                   = ["europe-west4-a", "europe-west4-b"]
  enable_private_endpoint = true
  enable_private_nodes    = true
  master_ipv4_cidr_block  = "172.16.0.0/28"


  network_project_id         = local.central_network_project_id
  network                    = module.central_shared_vpc_01.name
  subnetwork                 = module.sandbox-subnet-01.name
  ip_range_pods              = "${local.prefix}-k8s-netherland-sb-pod-range-01"
  ip_range_services          = "${local.prefix}-k8s-netherland-sb-svc-range-01"
  http_load_balancing        = true
  network_policy             = false
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = false
  remove_default_node_pool   = true


  master_authorized_networks = [{
    cidr_block   = "10.8.4.10/32"
    display_name = "net1"
  }]



  node_pools = [
    {
      name                   = "node-pool-1"
      machine_type           = "n1-standard-1"
      node_locations         = "europe-west4-a"
      min_count              = 1
      max_count              = 3
      local_ssd_count        = 1
      max_pods_per_node      = 8
      spot                   = false
      disk_size_gb           = 50
      disk_type              = "pd-standard"
      image_type             = "COS_CONTAINERD"
      enable_gcfs            = false
      enable_gvnic           = false
      auto_repair            = true
      auto_upgrade           = true #991938799169-compute@developer.gserviceaccount.com
      create_service_account = true
      service_account_name   = "project-service-account@terraform-foundation-modules.iam.gserviceaccount.com" #"service-991938799169@container-engine-robot.iam.gserviceaccount.com"
      preemptible            = false
      initial_node_count     = 2
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  depends_on = [google_compute_subnetwork_iam_member.subnetwork_sharing]
}
locals {
  prefix                     = "mtp"
  parent                     = "organizations/470452893592"
  central_network_project_id = "terraform-foundation-modules"
  primary_region             = "us-central1"
  billing_account            = "01B754-FB90BE-BF8E0A"
}

### Cloud Armor Locals #####

#locals {
#  cloud_armor_project_id = ["admin-project-359810"]
#  crs_version            = "v33-"   # Core Rule Set (CRS) verison, Please do not include . in betwen the version numbers
#  relase_type            = "stable" # can be stable or canary
#  sensitivity_level      = 1        #Can be upto 4, being 4 is the highest
#}
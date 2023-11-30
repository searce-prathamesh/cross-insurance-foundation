terraform {
  backend "gcs" {
    bucket      = "ebits-terraform"
    prefix      = "terraform/org_hierarchy"
  }
}
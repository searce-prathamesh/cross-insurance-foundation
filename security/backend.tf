terraform {
  backend "gcs" {
    bucket      = "ebits-terraform"
    prefix      = "terraform/security"
  }
}
locals {
  organization_id  = split("/", local.parent)[0] == "organizations" ? split("/", local.parent)[1] : null
  folder_id        = split("/", local.parent)[0] == "folders" ? split("/", local.parent)[1] : null
  policy_for       = split("/", local.parent)[0] == "organizations" ? "organization" : "folder"
  domains_to_allow = ["koddde.com"]
}


/******************************************
#        Compute org policies             #
#******************************************/

module "org_disable_nested_virtualization" {
  source  = "terraform-google-modules/org-policy/google"
  version = "~> 5.1"

  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = false
  constraint      = "constraints/compute.disableNestedVirtualization"
}

module "org_disable_serial_port_access" {
  source  = "terraform-google-modules/org-policy/google"
  version = "~> 5.1"

  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = false
  constraint      = "constraints/compute.disableSerialPortAccess"
}

module "org_compute_disable_guest_attributes_access" {
  source  = "terraform-google-modules/org-policy/google"
  version = "~> 5.1"

  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = false
  constraint      = "constraints/compute.disableGuestAttributesAccess"
}

module "org_vm_external_ip_access" {
  source  = "terraform-google-modules/org-policy/google"
  version = "~> 5.1"

  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "list"
  enforce         = false
  constraint      = "constraints/compute.vmExternalIpAccess"
}

module "org_skip_default_network" {
  source  = "terraform-google-modules/org-policy/google"
  version = "~> 5.1"

  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = false
  constraint      = "constraints/compute.skipDefaultNetworkCreation"
}

module "org_shared_vpc_lien_removal" {
  source  = "terraform-google-modules/org-policy/google"
  version = "~> 5.1"

  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = false
  constraint      = "constraints/compute.restrictXpnProjectLienRemoval"
}

/* module "org_shared_require_os_login" {
  source  = "terraform-google-modules/org-policy/google"
  version = "~> 5.1"

  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = false
  constraint      = "constraints/compute.requireOsLogin"
} */

/******************************************
  Cloud SQL
*******************************************/

module "org_cloudsql_external_ip_access" {
  source  = "terraform-google-modules/org-policy/google"
  version = "~> 5.1"

  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = false
  constraint      = "constraints/sql.restrictPublicIp"
}

/******************************************
  IAM
*******************************************/

/* module "org_domain_restricted_sharing" {
  source  = "terraform-google-modules/org-policy/google//modules/domain_restricted_sharing"
  version = "~> 5.1"

  organization_id  = local.organization_id
  folder_id        = local.folder_id
  policy_for       = local.policy_for
  domains_to_allow = local.domains_to_allow
} */

module "org_disable_sa_key_creation" {
  source  = "terraform-google-modules/org-policy/google"
  version = "~> 5.1"

  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = false
  constraint      = "constraints/iam.disableServiceAccountKeyCreation"
}

module "org_disable_sa_key_upload" {
  source  = "terraform-google-modules/org-policy/google"
  version = "~> 5.1"

  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = false
  constraint      = "constraints/iam.disableServiceAccountKeyUpload"
}

module "org_disable_automatic_iam_grants_on_default_service_accounts" {
  source  = "terraform-google-modules/org-policy/google"
  version = "~> 5.1"

  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = false
  constraint      = "constraints/iam.automaticIamGrantsForDefaultServiceAccounts"
}

/******************************************
  Storage
*******************************************/

module "org_enforce_bucket_level_access" {
  source  = "terraform-google-modules/org-policy/google"
  version = "~> 5.1"

  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = false
  constraint      = "constraints/storage.uniformBucketLevelAccess"
}
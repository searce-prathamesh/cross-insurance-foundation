module "firewall-rules-reconciliation-vpc" {
  source = "../terraform-modules/gcp_firewall_rules"

  project_id   = "nook-reconciliation-poc-01"
  network_name = "nook-reconciliation-vpc-01"

  ingress_rules = [{
    name                    = "nook-internal-all-ingress-allow-rule"
    description             = "Allow internal ingress form specific CIDR ranges"
    direction               = "INGRESS"
    priority                = 60000
    source_ranges           = ["10.0.0.0/8"]
    destination_ranges      = ["10.0.0.0/8"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "all"
    }]
    deny = []
    },
    {
      name                    = "nook-reconciliation-lb-health-check-ingress-allow-rule"
      description             = "Allow LB health-check from Google provided specific CIDR ranges, this firewall rule applies only to instances in the VPC network with a matching network tag."
      direction               = "INGRESS"
      priority                = 61000
      source_ranges           = ["35.191.0.0/16", "130.211.0.0/22", "209.85.152.0/22", "209.85.204.0/22"]
      destination_ranges      = []
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["http-lb"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["80", "443"]
      }]
      deny = []
    },
    {
      name                    = "nook-reconciliation-iap-ssh-ingress-allow-rule"
      description             = "Allow IAP-SSH access from Google-IAP range, this firewall rule applies only to instances in the VPC network with a matching network tag"
      direction               = "INGRESS"
      priority                = 62000
      source_ranges           = ["35.235.240.0/20"]
      destination_ranges      = []
      source_tags             = null
      source_service_accounts = null
      target_tags             = []
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["22"]
      }]
      deny = []
    },
    {
      name                    = "nook-reconciliation-external-ingress-http-allow-rule"
      description             = "Allow ingress traffic from all ip ranges on http and https ports only, this firewall rule applies only to instances in the VPC network with a matching network tag"
      direction               = "INGRESS"
      priority                = 59000
      source_ranges           = ["0.0.0.0/0"]
      destination_ranges      = []
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["http-server"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["80", "443", "8080"]
      }]
      deny = []
    },
    {
      name                    = "nook-reconciliation-internal-ingress-icmp-allow-rule"
      description             = "Allow ingress from internal CIDR range for icmp protocol"
      direction               = "INGRESS"
      priority                = 58000
      source_ranges           = ["10.0.0.0/8"]
      destination_ranges      = []
      source_tags             = null
      source_service_accounts = null
      target_tags             = null
      target_service_accounts = null
      allow = [{
        protocol = "icmp"
      }]
      deny = []
    }
  ]

  egress_rules = [{
    name                    = "nook-reconciliation-internal-infra-all-egress-allow-rule"
    description             = "This rule is to allow egress traffic for wider private CIDR so that endpoints with private IPs can talk to each other without any restrictions. It is only applicable for the traffic originating from the endpoints hosted in the VPC."
    priority                = 60000
    direction               = "EGRESS"
    source_ranges           = ["10.0.0.0/8"]
    destination_ranges      = ["10.0.0.0/8"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "all"
    }]
    deny = []
    },
    {
      name                    = "nook-reconciliation-internet-http-egress-allow-rule"
      description             = "This firewall rule allows egress from any source to internet for specific ports only"
      priority                = 64000
      direction               = "EGRESS"
      source_ranges           = ["10.0.0.0/8"]
      destination_ranges      = ["0.0.0.0/0"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = null
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["80", "443", "8080"]
      }]
      deny = []
    },
    {
      name                    = "nook-reconciliation-default-all-egress-deny-rule"
      description             = "An egress rule whose action is to deny all, It will deny all egress traffic irrespective of the source with a lower priority."
      priority                = 65000
      direction               = "EGRESS"
      source_ranges           = ["0.0.0.0/0"]
      destination_ranges      = ["0.0.0.0/0"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = null
      target_service_accounts = null
      allow                   = []
      deny = [{
        protocol = "all"
      }]
  }]

  depends_on = [module.dedicated_vpc_reconciliation]
}



#########################################################################################################



module "firewall-rules-reports-vpc" {
  source = "../terraform-modules/gcp_firewall_rules"

  project_id   = "nook-reports-poc-01"
  network_name = "nook-reports-vpc-01"

  ingress_rules = [{
    name                    = "nook-reports-internal-all-ingress-allow-rule"
    description             = "Allow internal ingress form specific CIDR ranges"
    direction               = "INGRESS"
    priority                = 60000
    source_ranges           = ["10.0.0.0/8"]
    destination_ranges      = ["10.0.0.0/8"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "all"
    }]
    deny = []
    },
    {
      name                    = "nook-reports-lb-health-check-ingress-allow-rule"
      description             = "Allow LB health-check from Google provided specific CIDR ranges, this firewall rule applies only to instances in the VPC network with a matching network tag."
      direction               = "INGRESS"
      priority                = 61000
      source_ranges           = ["35.191.0.0/16", "130.211.0.0/22", "209.85.152.0/22", "209.85.204.0/22"]
      destination_ranges      = []
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["http-lb"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["80", "443"]
      }]
      deny = []
    },
    {
      name                    = "nook-reports-iap-ssh-ingress-allow-rule"
      description             = "Allow IAP-SSH access from Google-IAP range, this firewall rule applies only to instances in the VPC network with a matching network tag"
      direction               = "INGRESS"
      priority                = 62000
      source_ranges           = ["35.235.240.0/20"]
      destination_ranges      = []
      source_tags             = null
      source_service_accounts = null
      target_tags             = []
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["22"]
      }]
      deny = []
    },
    {
      name                    = "nook-reports-external-ingress-http-allow-rule"
      description             = "Allow ingress traffic from all ip ranges on http and https ports only, this firewall rule applies only to instances in the VPC network with a matching network tag"
      direction               = "INGRESS"
      priority                = 59000
      source_ranges           = ["0.0.0.0/0"]
      destination_ranges      = []
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["http-server"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["80", "443", "8080"]
      }]
      deny = []
    },
    {
      name                    = "nook-reports-internal-ingress-icmp-allow-rule"
      description             = "Allow ingress from internal CIDR range for icmp protocol"
      direction               = "INGRESS"
      priority                = 58000
      source_ranges           = ["10.0.0.0/8"]
      destination_ranges      = []
      source_tags             = null
      source_service_accounts = null
      target_tags             = null
      target_service_accounts = null
      allow = [{
        protocol = "icmp"
      }]
      deny = []
    }
  ]

  egress_rules = [{
    name                    = "nook-reports-internal-infra-all-egress-allow-rule"
    description             = "This rule is to allow egress traffic for wider private CIDR so that endpoints with private IPs can talk to each other without any restrictions. It is only applicable for the traffic originating from the endpoints hosted in the VPC."
    priority                = 60000
    direction               = "EGRESS"
    source_ranges           = ["10.0.0.0/8"]
    destination_ranges      = ["10.0.0.0/8"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "all"
    }]
    deny = []
    },
    {
      name                    = "nook-reports-internet-http-egress-allow-rule"
      description             = "This firewall rule allows egress from any source to internet for specific ports only"
      priority                = 64000
      direction               = "EGRESS"
      source_ranges           = ["10.0.0.0/8"]
      destination_ranges      = ["0.0.0.0/0"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = null
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["80", "443", "8080"]
      }]
      deny = []
    },
    {
      name                    = "nook-reports-default-all-egress-deny-rule"
      description             = "An egress rule whose action is to deny all, It will deny all egress traffic irrespective of the source with a lower priority."
      priority                = 65000
      direction               = "EGRESS"
      source_ranges           = ["0.0.0.0/0"]
      destination_ranges      = ["0.0.0.0/0"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = null
      target_service_accounts = null
      allow                   = []
      deny = [{
        protocol = "all"
      }]
  }]

  depends_on = [module.dedicated_vpc_reports]
}
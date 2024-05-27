terraform {
  required_providers {
    equinix = {
      source  = "equinix/equinix"
      version = "1.36.0"
    }
  }
}

  cloud {
    organization = "EQIX_projectX"

    workspaces {
      name = "metal-emea"
    }
  }
}

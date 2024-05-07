terraform {
  required_providers {
    equinix = {
      source = "equinix/equinix"
      version = "1.36.0"
    }
  }
}
 
provider "equinix" {
  auth_token    = "xxxxxxxxxxxxxxx"
}
 
resource "equinix_metal_device" "server" {
  hostname         = "server.${count.index}"
  plan             = "m3.small.x86"
  metro            = "sg"
  operating_system = "ubuntu_22_04"
  billing_cycle    = "hourly"
  project_id       = "d0418d98-86af-417a-a50a-331c989ffe63"
  count = 3
}
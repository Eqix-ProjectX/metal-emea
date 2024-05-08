resource "equinix_metal_device" "server" {
  hostname         = "${var.hostname}-${count.index}"
  plan             = var.plan
  metro            = var.metro
  operating_system = var.operating_system
  billing_cycle    = var.billing_cycle
  project_id       = var.project_id
  count            = 3
}

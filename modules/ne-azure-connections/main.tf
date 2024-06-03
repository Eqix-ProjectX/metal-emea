
terraform {
  required_providers {
    equinix = {
      source = "equinix/equinix"
      version = "1.36.4"
    }
  }
}

provider equinix {
  client_id     = var.equinix_client_id
  client_secret = var.equinix_client_secret
}

resource "equinix_fabric_connection" "vd2azure_primary" {
  name = var.connection_name
  type = var.connection_type
  redundancy { priority = "PRIMARY" }
  notifications {
    type   = "ALL"
    emails = var.notifications_emails
  }
  bandwidth = var.bandwidth
  order {
    purchase_order_number = var.purchase_order_number
  }
  a_side {
    access_point {
      type = "VD"
      virtual_device {
        type = "EDGE"
        uuid = var.device_uuid
      }
      interface {
        type = "CLOUD"
        id = var.interface_number
      }
    }
  }
  z_side {
    access_point {
      type = "SP"
      authentication_key = var.authentication_key
      peering_type = "PRIVATE"
      profile {
        type = "L2_PROFILE"
        uuid = var.profile_uuid
      }
      location {
        metro_code = var.metro
      }
    }
  }
}

resource "equinix_fabric_connection" "vd2azure_secondary" {
  name = var.sec_connection_name
  type = var.sec_connection_type
  redundancy {
    priority = "SECONDARY"
    group = one(equinix_fabric_connection.vd2azure_primary.redundancy).group
  }
  notifications {
    type   = "ALL"
    emails = var.sec_notifications_emails
  }
  bandwidth = var.sec_bandwidth
  order {
    purchase_order_number = var.sec_purchase_order_number
  }
  a_side {
    access_point {
      type = "VD"
      virtual_device {
        type = "EDGE"
        uuid = var.sec_device_uuid
      }
      interface {
        type = "CLOUD"
        id = var.sec_interface_number
      }
    }
  }
  z_side {
    access_point {
      type = "SP"
      authentication_key = var.sec_authentication_key
      peering_type = "PRIVATE"
      profile {
        type = "L2_PROFILE"
        uuid = var.sec_profile_uuid
      }
      location {
        metro_code = var.sec_metro
      }
    }
  }
}


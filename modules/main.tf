resource "equinix_fabric_connection" "this" {
  name                 = var.connection_name
  type            = "EVPL_VC" 
  redundancy { priority = "PRIMARY" }
    notifications {
    type   = "ALL"
    emails = [var.email]
  }
  bandwidth            = var.bandwidth
 a_side {
    access_point {
      type = "VD"
      virtual_device {
        type = "EDGE"
        uuid = var.deviceuuid
      }
      interface {
        type = "CLOUD"
        id = var.interfaceid
      }
    }
  }
  z_side {
    access_point {
      type = "SP"
      authentication_key = var.authenticationkey
      peering_type = "PRIVATE"
      profile {
        type = "L2_PROFILE"
        uuid = "a1390b22-bbe0-4e93-ad37-85beef9d254d"
      }
      location {
        metro_code = var.metrocode
      }
    }
  }
}


resource "equinix_fabric_connection" "vd2azure_primary" {
  name = "ProjXAzure-Pri"
  type = "EVPL_VC" 
  redundancy { priority = "PRIMARY" }
  notifications {
    type   = "ALL"
    emails = ["kpriyadarshan@ap.equinix.com"]
  }
  bandwidth = 50
  a_side {
    access_point {
      type = "VD"
      virtual_device {
        type = "EDGE"
        uuid = equinix_network_device.c8kv-single.id
      }
      interface {
        type = "CLOUD"
        id = 7
      }
    }
  }
  z_side {
    access_point {
      type = "SP"
      authentication_key = "a7b582b5-45b0-41f4-b70a-c8bb7a8f29d1"
      peering_type = "PRIVATE"
      profile {
        type = "L2_PROFILE"
        uuid = "a1390b22-bbe0-4e93-ad37-85beef9d254d"
      }
      location {
        metro_code = "SG"
      }
    }
  }
}

resource "equinix_fabric_connection" "vd2azure_secondary" {
  name = "ProjXAzure-Sec"
  type = "EVPL_VC"
  redundancy {
    priority = "SECONDARY"
    group = one(equinix_fabric_connection.vd2azure_primary.redundancy).group
  }
  notifications {
    type   = "ALL"
    emails = ["kpriyadarshan@ap.equinix.com"]
  }
  bandwidth = 50
  order {
    purchase_order_number = "1-323292"
  }
  a_side {
    access_point {
      type = "VD"
      virtual_device {
        type = "EDGE"
        uuid = equinix_network_device.c8kv-single.id
      }
      interface {
        type = "CLOUD"
        id = 8
      }
    }
  }
  z_side {
    access_point {
      type = "SP"
      authentication_key = "a7b582b5-45b0-41f4-b70a-c8bb7a8f29d1"
      peering_type = "PRIVATE"
      profile {
        type = "L2_PROFILE"
        uuid = "a1390b22-bbe0-4e93-ad37-85beef9d254d"
      }
      location {
        metro_code = "SG"
      }
    }
  }
}
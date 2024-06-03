

variable "equinix_client_id" {
  description = "Equinix client ID (consumer key), obtained after registering app in the developer platform"
  type        = string
}
variable "equinix_client_secret" {
  description = "Equinix client secret ID (consumer secret), obtained after registering app in the developer platform"
  type        = string
}

variable "connection_name" {
  description = "Connection name. An alpha-numeric 24 characters string which can include only hyphens and underscores"
  type        = string
}
variable "connection_type" {
  description = "Defines the connection type like VG_VC, EVPL_VC, EPL_VC, EC_VC, IP_VC, ACCESS_EPL_VC"
  type        = string
}

variable "notifications_emails" {
  description = "Array of contact emails"
  type        = list(string)
}
variable "bandwidth" {
  description = "Connection bandwidth in Mbps"
  type        = number
}
variable "purchase_order_number" {
  description = "Purchase order number"
  type        = string
}

variable "device_uuid" {
  description = "Device UUID"
  type        = string
}

variable "interface_number" {
  description = "Device Interface"
  type        = string
}
variable "authentication_key" {
  description = "Azure key"
  type        = string
}
variable "profile_uuid" {
  description = "Azure profile UUID"
  type        = string
}
variable "metro" {
  description = "Metro"
  type        = string
}


############# Secondary Connection Variables #################


variable "sec_connection_name" {
  description = "Connection name. An alpha-numeric 24 characters string which can include only hyphens and underscores"
  type        = string
}
variable "sec_connection_type" {
  description = "Defines the connection type like VG_VC, EVPL_VC, EPL_VC, EC_VC, IP_VC, ACCESS_EPL_VC"
  type        = string
}

variable "sec_notifications_emails" {
  description = "Array of contact emails"
  type        = list(string)
}
variable "sec_bandwidth" {
  description = "Connection bandwidth in Mbps"
  type        = number
}
variable "sec_purchase_order_number" {
  description = "Purchase order number"
  type        = string
}

variable "sec_device_uuid" {
  description = "Device UUID"
  type        = string
}

variable "sec_interface_number" {
  description = "Device Interface"
  type        = string
}
variable "sec_authentication_key" {
  description = "Azure key"
  type        = string
}
variable "sec_profile_uuid" {
  description = "Azure profile UUID"
  type        = string
}
variable "sec_metro" {
  description = "Metro"
  type        = string
}


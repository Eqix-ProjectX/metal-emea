variable "hostname" {
  type = string
}

variable "plan" {
  type = string
}

variable "metro" {
  type = string
}

variable "operating_system" {
  type = string
}

variable "billing_cycle" {
  type    = string
  default = "hourly"
}

variable "project_id" {
  type = string
}

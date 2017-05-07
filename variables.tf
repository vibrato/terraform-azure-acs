variable "subscription_id" {
  type        = "string"
  description = ""
}

variable "client_id" {
  type        = "string"
  description = ""
}

variable "client_secret" {
  type        = "string"
  description = ""
}

variable "kube_client_id" {
  type        = "string"
  description = ""
}

variable "kube_client_secret" {
  type        = "string"
  description = ""
}

variable "tenant_id" {
  type        = "string"
  description = ""
}

variable "stack_name" {
  type        = "string"
  description = ""
}

variable "azure_location" {
  type        = "string"
  description = ""
}

variable "environment" {
  type    = "string"
  default = "development"
}

variable "os_admin_username" {
  type    = "string"
  default = "os_admin"
}

variable "enableDiagnostics" {
  type    = "string"
  default = "true"
}

variable "vnet_cidr" {
  type    = "string"
  default = "10.0.0.0/16"
}

variable "subnets" {
  type = "list"

  default = [
    "dmz",
    "application",
    "data",
  ]
}

variable "vm_size" {
  type    = "string"
  default = "Standard_DS1_v2"
}

variable "agent_count" {
  type    = "string"
  default = 3
}

variable "subscription_id" {
  type        = "string"
  description = ""
}

variable "tenant_id" {
  type        = "string"
  description = "https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Properties Directory ID"
}

variable "client_id" {
  type        = "string"
  description = "Application ID from Azure AD App Registration"
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

variable "stack_name" {
  type    = "string"
  default = "terraformacs"
}

variable "azure_location" {
  type        = "string"
  description = ""
  default     = "Australia Southeast"
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

variable "git_repo" {
  type    = "string"
  default = "unset"
}

variable "git_branch" {
  type    = "string"
  default = "unset"
}

variable "git_commit" {
  type    = "string"
  default = "unset"
}

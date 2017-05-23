resource "random_id" "storage_suffix" {
  keepers = {
    environment = "${var.environment}"
    stack_name  = "${var.stack_name}"
  }

  byte_length = "4"
}

resource "azurerm_storage_account" "container_registry" {
  name                = "cont${lower(var.stack_name)}${random_id.storage_suffix.hex}"
  resource_group_name = "${azurerm_resource_group.res_group.name}"
  location            = "${azurerm_resource_group.res_group.location}"
  account_type        = "Standard_GRS"

  tags {
    environment = "${var.environment}"
    stack_name  = "${var.stack_name}"
    contents    = "containers"
    git_repo    = "${var.git_repo}"
    git_commit  = "${var.git_commit}"
    git_branch  = "${var.git_branch}"
  }
}

resource "azurerm_storage_account" "storage" {
  name                   = "vhds${lower(var.stack_name)}${random_id.storage_suffix.hex}"
  resource_group_name    = "${azurerm_resource_group.res_group.name}"
  location               = "${azurerm_resource_group.res_group.location}"
  account_type           = "Standard_LRS"
  enable_blob_encryption = true

  tags {
    environment = "${var.environment}"
    stack_name  = "${var.stack_name}"
    contents    = "vhds"
    git_repo    = "${var.git_repo}"
    git_commit  = "${var.git_commit}"
    git_branch  = "${var.git_branch}"
  }
}

resource "azurerm_storage_account" "logs" {
  name                   = "logs${lower(var.stack_name)}${random_id.storage_suffix.hex}"
  resource_group_name    = "${azurerm_resource_group.res_group.name}"
  location               = "${azurerm_resource_group.res_group.location}"
  account_type           = "Standard_LRS"
  enable_blob_encryption = true

  tags {
    environment = "${var.environment}"
    stack_name  = "${var.stack_name}"
    contents    = "logs"
    git_repo    = "${var.git_repo}"
    git_commit  = "${var.git_commit}"
    git_branch  = "${var.git_branch}"
  }
}

resource "azurerm_storage_container" "logs" {
  name                  = "logs"
  resource_group_name   = "${azurerm_resource_group.res_group.name}"
  storage_account_name  = "${azurerm_storage_account.logs.name}"
  container_access_type = "private"
}

resource "azurerm_storage_container" "vhds" {
  name                  = "vhds"
  resource_group_name   = "${azurerm_resource_group.res_group.name}"
  storage_account_name  = "${azurerm_storage_account.storage.name}"
  container_access_type = "private"
}

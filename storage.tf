resource "azurerm_storage_account" "storage" {
  name                   = "vhds${lower(var.stack_name)}${element(split("-", uuid()), 0)}"
  resource_group_name    = "${azurerm_resource_group.res_group.name}"
  location               = "${var.azure_location}"
  account_type           = "Standard_LRS"
  enable_blob_encryption = true

  tags {
    environment = "${var.environment}"
    stack_name  = "${var.stack_name}"
    git_repo    = "${var.git_repo}"
    git_commit  = "${var.git_commit}"
    git_branch  = "${var.git_branch}"
  }

  lifecycle {
    ignore_changes = [
      "name",
    ]
  }
}

resource "azurerm_storage_account" "logs" {
  name                   = "logs${lower(var.stack_name)}${element(split("-", uuid()), 0)}"
  resource_group_name    = "${azurerm_resource_group.res_group.name}"
  location               = "${var.azure_location}"
  account_type           = "Standard_LRS"
  enable_blob_encryption = true

  tags {
    environment = "${var.environment}"
    stack_name  = "${var.stack_name}"
    git_repo    = "${var.git_repo}"
    git_commit  = "${var.git_commit}"
    git_branch  = "${var.git_branch}"
    role        = "logs"
  }

  lifecycle {
    ignore_changes = [
      "name",
    ]
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

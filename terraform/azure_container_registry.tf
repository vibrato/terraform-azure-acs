resource "azurerm_container_registry" "container_registry" {
  name                = "${var.stack_name}containers"
  resource_group_name = "${azurerm_resource_group.res_group.name}"
  location            = "${azurerm_resource_group.res_group.location}"
  admin_enabled       = true

  storage_account {
    name       = "${azurerm_storage_account.container_registry.name}"
    access_key = "${azurerm_storage_account.container_registry.primary_access_key}"
  }
}

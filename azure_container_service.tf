resource "azurerm_container_service" "container_service" {
  name                   = "${var.stack_name}containers"
  location               = "${azurerm_resource_group.res_group.location}"
  resource_group_name    = "${azurerm_resource_group.res_group.name}"
  orchestration_platform = "Kubernetes"

  master_profile {
    count      = 1
    dns_prefix = "${lower(var.stack_name)}-master"
  }

  linux_profile {
    admin_username = "${var.os_admin_username}"

    ssh_key {
      key_data = "${tls_private_key.key.public_key_openssh}"
    }
  }

  agent_pool_profile {
    name       = "default"
    count      = "${var.agent_count}"
    dns_prefix = "${lower(var.stack_name)}"
    vm_size    = "${var.vm_size}"
  }

  diagnostics_profile {
    enabled = false
  }

  service_principal {
    client_id     = "${var.kube_client_id}"
    client_secret = "${var.kube_client_secret}"
  }
}
provider "kubernetes" {
  config_path = "${path.module}/kube.config"
}

resource "kubernetes_secret" "cosmosdb_secret" {
  metadata {
    name = "cosmosdb"
  }

  data {
    AccountKey      = "${azurerm_template_deployment.cosmosdb.outputs["documentDbPrimaryMasterKey"]}"
    AccountEndpoint = "https://${var.stack_name}db.documents.azure.com:443/"
  }

  depends_on = [
    "null_resource.kube_config",
  ]
}

resource "null_resource" "registry_secret" {
  provisioner "local-exec" {
    command = "kubectl create secret docker-registry registrykey --docker-server=${azurerm_container_registry.container_registry.login_server} --docker-username=${azurerm_container_registry.container_registry.admin_username} --docker-password=${azurerm_container_registry.container_registry.admin_password} --docker-email=${var.email} --kubeconfig=${path.module}/kube.config"
  }

  depends_on = [
    "null_resource.kube_config",
    "azurerm_container_registry.container_registry",
  ]
}


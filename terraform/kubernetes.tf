provider "kubernetes" {
  config_path = "${path.module}/kube.config"
}

resource "kubernetes_secret" "cosmosdb_secret" {
  metadata {
    name = "cosmosdb"
  }

  data {
    AccountKey = "${azurerm_template_deployment.cosmosdb.outputs["documentDbPrimaryMasterKey"]}"
    AccountEndpoint = "https://${var.stack_name}db.documents.azure.com:443/"
  }

  depends_on = [
    "null_resource.kube_config"
  ]
}
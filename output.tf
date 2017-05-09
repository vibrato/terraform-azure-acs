output "kube_get_creds_cmd" {
  value = "az acs kubernetes get-credentials --resource-group=${azurerm_resource_group.res_group.name} --name=${var.stack_name}containers"
}

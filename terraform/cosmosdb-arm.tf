data "template_file" "arm_template" {
  template = "${file("${path.module}/templates/arm/cosmosdb.json")}"

  vars {
    databaseAccountName = "${var.stack_name}db"
  }
}

resource "azurerm_template_deployment" "cosmosdb" {
  name                = "cosmosdb"
  resource_group_name = "${azurerm_resource_group.res_group.name}"

  template_body = "${data.template_file.arm_template.rendered}"

  deployment_mode = "Incremental"
}
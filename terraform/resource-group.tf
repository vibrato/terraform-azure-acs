resource "azurerm_resource_group" "res_group" {
  name     = "${lower(var.stack_name)}"
  location = "${var.azure_location}"

  tags {
    environment = "${var.environment}"
    stack_name  = "${var.stack_name}"
    git_repo    = "${var.git_repo}"
    git_commit  = "${var.git_commit}"
    git_branch  = "${var.git_branch}"
  }
}

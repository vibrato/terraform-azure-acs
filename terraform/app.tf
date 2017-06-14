data "template_file" "deployment_template" {
  template = "${file("${path.module}/templates/kube/deployment-config.yml")}"

  vars {
    image = "${azurerm_container_registry.container_registry.login_server}/demo-apps/cosmosdb/nodejs"
    version = "${var.deploy_version}"
  }
}

resource "local_file" "deployment_template" {
  content  = "${data.template_file.deployment_template.rendered}"
  filename = "${path.module}/tmp/app_deploy.yml"
}

resource "null_resource" "app_deployment" {
  provisioner "local-exec" {
    command = "kubectl apply --filename=${path.module}/tmp/app_deploy.yml --kubeconfig=${path.module}/kube.config"
  }

  depends_on = [
    "null_resource.kube_config",
    "local_file.deployment_template",
    "azurerm_container_registry.container_registry",
  ]

    triggers {
    cluster_instance_ids = "${data.template_file.deployment_template.rendered}"
  }
}

resource "null_resource" "service_deployment" {
  provisioner "local-exec" {
    command = "kubectl apply --filename=${path.module}/templates/kube/service-config.yml --kubeconfig=${path.module}/kube.config"
  }

  depends_on = [
    "null_resource.app_deployment"
  ]
}


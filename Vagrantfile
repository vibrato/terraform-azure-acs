# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"

  config.vm.synced_folder "./", "/home/vagrant/terraform-azure-acs"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
  
    vb.memory = "1024"
  end

  config.vm.provision "shell", path: "provision.sh"
end

# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  config.vm.define "controller" do |controller|
    controller.vm.box = "generic/rhel8"
    controller.vm.network "private_network", ip: "192.168.33.40"
    controller.vm.hostname = "controller"
    controller.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    controller.vm.provision "shell",
      path: "install.sh",
      env: {
        "REDHATUSERNAME" => ENV["REDHATUSERNAME"],
        "REDHATPASSWORD" => ENV["REDHATPASSWORD"]
      }
  end
end
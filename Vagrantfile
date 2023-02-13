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
    # controller.vm.provision "file",
    #   source: ".ansible.cfg",
    #   destination: ".ansible.cfg"
    # controller.vm.provision "file",
    #   source: "inventory",
      # destination: "inventory"
    controller.vm.provision "shell",
      path: "install.sh"
      # env: {
      #   "REDHATUSERNAME" => ENV["REDHATUSERNAME"],
      #   "REDHATPASSWORD" => ENV["REDHATPASSWORD"]
      # }
  end
  config.vm.define "elk" do |elk|
    elk.vm.box = "ubuntu/focal64"
    elk.vm.network "private_network", ip: "192.168.33.41"
    elk.vm.hostname =  "elk"
    elk.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
    end
  end
end
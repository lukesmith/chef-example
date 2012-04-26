# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "lucid32"

  # config.vm.box_url = "http://domain.com/path/to/above.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  config.vm.boot_mode = :gui

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  # config.vm.forward_port 80, 8080

  config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "cookbooks"
     chef.roles_path = "roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
     chef.add_role "web"

     chef.add_recipe "postgresql::server"

     chef.json = { }

  end

end

# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "centos/7"
  N=3
  (1..N).each do |id|
    config.vm.define "centos70#{id}" do |host|
      host.vm.hostname = "centos70#{id}"
      if id == 1
        host.vm.network "forwarded_port", guest: 25,  host: 10025, host_ip: "127.0.0.1"
        host.vm.network "forwarded_port", guest: 110, host: 10110, host_ip: "127.0.0.1"
        host.vm.network "forwarded_port", guest: 143, host: 10143, host_ip: "127.0.0.1"
      end
      host.vm.network "private_network", ip: "192.168.33.10#{id}"
      host.vm.provision "ansible" do |ansible|
        ansible.playbook = "ansible/playbook.yml"
        ansible.config_file = "ansible/ansible.cfg"
        ansible.verbose  = true
      end
#      host.vm.provision :serverspec do |spec|
#        spec.pattern = 'spec/*_spec.rb'
#        spec.error_no_spec_files = false
#      end
    end
  end

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.


end

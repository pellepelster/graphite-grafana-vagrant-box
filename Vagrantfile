# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

	config.vm.box = "ubuntu/trusty64"
	config.vm.synced_folder ".", "/vagrant", disabled: true
	config.vm.network "forwarded_port", guest: 80, host: 1080
	config.vm.network "forwarded_port", guest: 2003, host: 2003
	
	config.vm.provision :ansible do |ansible|
		ansible.playbook = "graphite-grafana.yml"
		ansible.sudo = true
	end
  
  config.vm.define :graphite_grafana do |g|
  end  

	config.vm.provider :virtualbox do |vb|
		vb.customize ["modifyvm", :id, "--memory", "2048"]
		vb.customize ["modifyvm", :id, "--cpus", "2"]
	end
	
end

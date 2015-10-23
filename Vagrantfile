# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

http_port = 1080
base_url = "http://localhost:#{http_port}"

$info_message = <<SCRIPT
echo "================================================================================\n"
echo "grafana up and running at #{base_url}/grafana"
echo "================================================================================\n"
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

	config.vm.box = "ubuntu/trusty64"
	config.vm.synced_folder ".", "/vagrant", disabled: true
	config.vm.network "forwarded_port", guest: 80, host: http_port
	config.vm.network "forwarded_port", guest: 2003, host: 2003

	config.vm.provision :ansible do |ansible|
		ansible.playbook = "site.yml"
		ansible.groups = {
    	"graphite-grafana" => ["default"]
    }
		ansible.extra_vars = {
			base_url: base_url
	}
	end

	config.vm.provider :virtualbox do |vb|
		vb.customize ["modifyvm", :id, "--memory", "2048"]
		vb.customize ["modifyvm", :id, "--cpus", "2"]
	end

	config.vm.provision "shell", inline: $info_message
	
end

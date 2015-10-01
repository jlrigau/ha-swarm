# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  2.times do |number|
    config.vm.define "node#{number}" do |node|
      node.vm.hostname = "node#{number}"

      node.vm.provision "shell", inline: <<-SHELL
        apt-get update
        apt-get install -y git jq

        curl https://experimental.docker.com | bash
        gpasswd -a vagrant docker

        curl -L https://github.com/docker/compose/releases/download/1.4.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose

        echo 'DOCKER_OPTS="-H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375"' >> /etc/default/docker

        service docker restart

        /vagrant/update-configuration.sh
      SHELL

      node.vm.network "private_network", ip: "192.168.33.10#{number}"
    end
  end

end

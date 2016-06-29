# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, :path => "provision.sh"
  config.vm.hostname = "ease"
  config.vm.network "private_network", ip: "33.33.33.33"   # access vagrant at 33.33.33.33 in browser
  config.vm.network "forwarded_port", guest: 80, host: 9000
  config.vm.network "public_network"    # access over wifi
  config.vm.synced_folder ".", "/home/vagrant/gocode/src/ease"    # sync git repo w ~/gocode/src/ease
  config.ssh.forward_agent = true    # git commands in vagrant if you need em
  config.vm.provider 'virtualbox' do |vb|
    vb.name = "ease"
    vb.memory = "2048"    # 2GB
    vb.cpus = 2    # for parallelism
  end
end

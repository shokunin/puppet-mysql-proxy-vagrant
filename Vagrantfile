VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider "virtualbox" do |p|
    p.name = "mysqlproxy"
    p.memory = 2048
    p.cpus = 2
  end

  config.vm.provision "shell",
    inline: "/usr/bin/apt-get -y install puppet"

  config.vm.define "proxy" do |server|
    server.vm.box = "ubuntu/xenial64"
    server.vm.host_name = 'proxy'
    server.vm.network "forwarded_port", guest: 3306, host: 3306
    server.vm.network "forwarded_port", guest: 3307, host: 3307
    server.vm.network "private_network", ip: "172.16.3.101"
    server.vm.synced_folder "puppet/ext", "/tmp/vagrant-puppet/puppet/ext"
    server.vm.synced_folder "puppet/modules", "/tmp/vagrant-puppet/puppet/modules"
    server.vm.provision :puppet do |puppet|
      puppet.hiera_config_path = "puppet/ext/hiera.yaml"
      puppet.manifests_path = "puppet/manifests"
      puppet.options = ["--modulepath", "/tmp/vagrant-puppet/puppet/modules", "--parser", "future"]
      puppet.manifest_file = "mysql.pp"
    end
  end #server

end

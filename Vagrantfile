# https://www.sitepoint.com/vagrantfile-explained-setting-provisioning-shell/
# https://www.linode.com/docs/applications/configuration-management/vagrant-linode-environments/
Vagrant.configure("2") do |config|
    # Specify the base box
    config.vm.box = "ubuntu/bionic64"

    # Setup synced folder
    # config.vm.synced_folder "./", "/var/www", create: true, group: "www-data", owner: "www-data"

    ## SSH Configuration
    config.ssh.username = 'user'
    config.ssh.private_key_path = '~/.ssh/id_rsa'

    # Global Configuration
    config.vm.provider :linode do |provider, override|
      override.vm.box = 'linode'
      override.vm.box_url = "https://github.com/displague/vagrant-linode/raw/master/box/linode.box"
      provider.token = 'API-KEY'
      provider.distribution = 'Ubuntu 20.04 LTS'
      provider.datacenter = 'dallas'
      provider.plan = '2048'
      # provider.label = 'vagrant-ubuntu-lts'
    end

    # Shell provisioning
    config.vm.provision "shell" do |s|
    	s.path = "provision/setup.sh"
    end
end

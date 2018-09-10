
Vagrant.configure(2) do |config|
  server_name = "devmachine"

  config.vm.box = "ubuntu/bionic64"

  config.vm.define server_name

  # config.landrush.tld     = "vm"
  # config.landrush.enabled = true

  # Box
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--name", server_name]
    vb.customize ["modifyvm", :id, "--memory", 2048]
    vb.customize ["modifyvm", :id, "--cpus", 2]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  # Networking
  config.vm.network :private_network, ip: "192.168.2.106"
  config.vm.hostname = "dmitri.vm"

  # Provisioning
  config.vm.provision :ansible do |ansible|
    ansible.playbook           = "./playbooks/install.yml" # setup.yml
    ansible.extra_vars         = { hostname: server_name, fqdn: "dmitri.vm" }
    ansible.limit              = "webservers"
    ansible.inventory_path     = "./playbooks/hosts.local"
    ansible.become             = true
    ansible.compatibility_mode = "2.0"
    # ansible.ask_vault_pass     = true
    # ansible.tags               = "nginx"
    # ansible.verbose            = "vvv"
  end

end

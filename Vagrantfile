VAGRANTFILE_API_VERSION = "2"
VAGRANT_DISABLE_VBOXSYMLINKCREATE = "1"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  file_to_disk = "secondary.vmdk"
  # Use same SSH key for each machine
  config.ssh.insert_key = false
  config.vm.box_check_update = true
  config.vm.define "node1" do |node1|
    node1.vm.box = "rdbreak/ansible27node"
    node1.vm.network "private_network", ip: "192.168.55.61"
    node1.vm.provider "virtualbox" do |node1|
      node1.name = "node1"
      node1.memory = "1024"
    end
  end
  config.vm.define "node2" do |node2|
    node2.vm.box = "rdbreak/ansible27node"
    node2.vm.network "private_network", ip: "192.168.55.62"
    node2.vm.provider "virtualbox" do |node2|
      node2.name = "node2"
      node2.memory = "1024"
    end
  end
  config.vm.define "node3" do |node3|
    node3.vm.box = "rdbreak/ansible27node"
    node3.vm.network "private_network", ip: "192.168.55.63"
    node3.vm.provider "virtualbox" do |node3|
      node3.name = "node3"
      node3.memory = "1024"
    end
  end
  config.vm.define "node4" do |node4|
    node4.vm.box = "rdbreak/ansible27node"
    node4.vm.network "private_network", ip: "192.168.55.64"
    node4.vm.provider "virtualbox" do |node4|
      node4.name = "node4"
      node4.memory = "1024"
      unless File.exist?(file_to_disk)
        node4.customize ["createhd", "--filename", file_to_disk,"--size",1024]
      end
      node4.customize ["storageattach", "node4", "--storagectl", "IDE Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", file_to_disk]
    end
  end
    
  config.vm.define "repo" do |repo|
    repo.vm.box = "rdbreak/ansible27repo"
    repo.vm.network "private_network", ip: "192.168.55.59"
    repo.vm.provider "virtualbox" do |repo|
      repo.memory = "1024"
    end
  end

  config.vm.define "control" do |control|
      control.vm.box = "rdbreak/ansible27node"
      control.vm.network "private_network", ip: "192.168.55.60"
      control.vm.provider :virtualbox do |control|
        control.customize ['modifyvm', :id,'--memory', '2048']
      end
      control.vm.provision :ansible_local do |ansible|
        ansible.playbook = '/vagrant/playbooks/envplaybooks/master.yml'
        ansible.install = false
        ansible.compatibility_mode = "2.0"
        ansible.inventory_path = "/vagrant/inventory"
        ansible.config_file = "/vagrant/ansible.cfg"
        ansible.limit = "all"
      end
    end
end
include_recipe 'chef-provisioning-vagrant-helper::default'

machine_batch 'precreate' do
  action [:converge]
  node['chef-server-monitoring']['nodes'].each do |vmname|
    machine "csm-#{vmname}" do
      attribute 'chef-server-monitoring', { use_interface: 'eth1' }
      #get_node_runlist(vmname).each do |r|
        recipe get_node_runlist(vmname)
      #end
      machine_options vagrant_options(vmname)
      # see chef-provisioning-vagrant-helper/libraries/vagrant_config.rb
    end
  end
end

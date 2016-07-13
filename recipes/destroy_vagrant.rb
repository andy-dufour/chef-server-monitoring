include_recipe 'chef-provisioning-vagrant-helper::default'

machine_batch do
  action :destroy
  machines search(:node, '*:*').map { |n| n.name }
end

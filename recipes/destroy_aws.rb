
include_recipe 'chef-provisioning-aws-helper::default'

machine_batch do
  action :destroy
  machines search(:node, '*:*').map { |n| n.name }
end

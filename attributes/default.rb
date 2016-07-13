default['chef-server-monitoring']['provisioning']['driver'] = 'vagrant'
default['chef-server-monitoring']['nodes'] = ['monitor', 'vis', 'splunk', 'chef-server']
default['chef-server-monitoring']['use_interface'] = 'eth1'
default['chef-provisioning-vagrant']['vbox']['box'] = 'bento/ubuntu-14.04'
default['chef-provisioning-vagrant']['vbox']['ram'] = 2048
default['chef-provisioning-vagrant']['vbox']['cpus'] = 1
default['chef-provisioning-vagrant']['vbox']['private_networks']['default'] = 'dhcp'

# AWS settings
default['chef-provisioning-aws']['region'] = 'us-east-1'
default['chef-provisioning-aws']['ssh_username'] = 'ubuntu'
default['chef-provisioning-aws']['instance_type'] = 'm3.medium'
default['chef-provisioning-aws']['ebs_optimized'] = true
default['chef-provisioning-aws']['image_id'] = 'ami-fce3c696' # Ubuntu 14.04
#default['chef-provisioning-aws']['subnet_id'] = 'subnet-b2bb82f4'
default['chef-provisioning-aws']['keypair_name'] = "#{ENV['USER']}@chef-server-monitoring"

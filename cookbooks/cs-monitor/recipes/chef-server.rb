remote_file '/tmp/chef-server-core.deb' do
  source 'https://packages.chef.io/stable/ubuntu/14.04/chef-server-core_12.8.0-1_amd64.deb'
end

dpkg_package 'chef-server-core' do
  source '/tmp/chef-server-core.deb'
end

template '/etc/opscode/chef-server.rb' do
  source 'chef-server.rb.erb'
  notifies :run, 'execute[chef-server-ctl reconfigure]', :immediately
end

execute 'chef-server-ctl reconfigure' do
  command 'chef-server-ctl reconfigure'
  action :nothing
end

include_recipe 'cs-monitor::statsd'

execute 'chef-server-ctl test' do
  command 'chef-server-ctl test & >> /tmp/csc-test.log'
end

include_recipe 'cs-monitor::sensu_client'

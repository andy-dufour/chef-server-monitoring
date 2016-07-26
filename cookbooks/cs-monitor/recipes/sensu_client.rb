#
# Cookbook Name:: chef-server-monitoring
# Recipe:: sensu_client
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

master_address = '172.28.128.9'

package 'runit'

node.override["sensu"]["rabbitmq"]["host"] = master_address
node.override["sensu"]["redis"]["host"] = master_address
node.override["sensu"]["api"]["host"] = master_address

file '/etc/apt/apt.conf.d/15update-stamp' do
  action :delete
end
include_recipe 'sensu::default'

sensu_client node.name do
  if node.has_key?("cloud")
    address node["cloud"][ip_type] || node["ipaddress"]
  else
    address node["ipaddress"]
  end
  subscriptions node["roles"] + ["all"]
  #additional client_attributes
end


%w[
  check-http.rb
  check-fs-writable.rb
  check-metrics-vmstat.rb
].each do |default_plugin|
  cookbook_file "/etc/sensu/plugins/#{default_plugin}" do
    source "sensu_plugins/#{default_plugin}"
    mode 0755
  end
end

sensu_gem 'sensu-plugins-disk-checks'
sensu_gem 'sensu-plugins-vmstats'

include_recipe "sensu::client_service"

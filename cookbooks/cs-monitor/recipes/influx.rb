#
# Cookbook Name:: cs-monitor
# Recipe:: influx
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


include_recipe 'cs-monitor::_influx_repo'

package 'influxdb'

template '/etc/influxdb/influxdb.conf' do
  source 'influxdb.conf.erb'
  notifies :restart, 'service[influxdb]', :delayed
end

service 'influxdb' do
  action [:enable, :start]
end

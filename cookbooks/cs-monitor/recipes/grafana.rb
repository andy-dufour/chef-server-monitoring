#
# Cookbook Name:: cs-grafana
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

directory '/etc/grafana' do
  action :create
end

directory '/usr/share/grafana/public/dashboards' do
  recursive true
  action :create
end

%w(chef_overall_api bifrost_overall_api reporting_overall_api).each do |dashboard|
  cookbook_file "/usr/share/grafana/public/dashboards/#{dashboard}.json" do
    source "dashboards/#{dashboard}.json"
    action :create
  end
end

include_recipe 'chef-grafana'
include_recipe 'cs-monitor::_grafana_nginx'

grafana_datasource 'influxdb graphite' do
     type 'influxdb'
     iface 'eth1'
end

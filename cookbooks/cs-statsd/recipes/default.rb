#
# Cookbook Name:: cs-statsd
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute 'apt-get update' do
  command 'apt-get update'
  only_if { node.platform == 'ubuntu' }
end

package 'nodejs'
package 'git'

group "_statsd" do
  system true
end

user "_statsd" do
  comment 'StatsD User'
  system true
  shell '/bin/false'
  home '/nonexistent'
  gid '_statsd'
end

directory "/var/run/statsd" do
  owner '_statsd'
  group '_statsd'
  mode '0755'
end

git "/opt/statsd" do
  repository "https://github.com/etsy/statsd"
  revision "master"
  action :sync
end

template "/opt/statsd/localConfig.js" do
  source "localConfig.js.erb"
end

# Upstart service
cookbook_file "/etc/init/statsd.conf" do
  source "statsd.conf"
end

service "statsd" do
  provider Chef::Provider::Service::Upstart
  action [:enable, :start]
end

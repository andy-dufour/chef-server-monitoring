#
# Cookbook Name:: chef-server-monitoring
# Recipe:: sensu_server
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package 'runit'

user 'sensu'
group 'sensu'


file '/etc/apt/apt.conf.d/15update-stamp' do
  action :delete
end

include_recipe "sensu::rabbitmq"
include_recipe "sensu::redis"

include_recipe "sensu::default"
include_recipe "cs-monitor::_sensu_worker"
include_recipe "sensu::api_service"
include_recipe "cs-monitor::sensu_client"

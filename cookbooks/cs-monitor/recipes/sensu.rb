#
# Cookbook Name:: chef-server-monitoring
# Recipe:: sensu
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'monitor::redis'
include_recipe 'monitor::rabbitmq'
include_recipe 'monitor::master'

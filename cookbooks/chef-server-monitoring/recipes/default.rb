#
# Cookbook Name:: chef-server-monitoring
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "chef-server-monitoring::sensu"
include_recipe "chef-server-monitoring::graphite"

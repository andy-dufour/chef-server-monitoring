#
# Cookbook Name:: chef-server-monitoring
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "cs-monitor::sensu"
#include_recipe "chef-server-monitoring::graphite"

include_recipe "cs-monitor::influx"

include_recipe "cs-monitor::grafana"

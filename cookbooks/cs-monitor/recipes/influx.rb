#
# Cookbook Name:: cs-monitor
# Recipe:: influx
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'tick-stack::influx'
include_recipe 'tick-stack::telegraf'

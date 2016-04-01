#
# Cookbook Name:: cs-grafana
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

directory '/usr/share/grafana/public/dashboards' do
  recursive true
  action :create
end

%w(chef_overall_api bifrost_overall_api reporting_overall_api).each do |dashboard|
  cookbook_file "/usr/share/grafana/public/dashboards/#{dashboard}.json" do
    source "#{dashboard}.json"
    action :create
  end
end

include_recipe 'chef-grafana'
include_recipe 'cs-grafana::nginx'

ruby_block 'create grafana datasource' do
  block do
    require 'net/http'

    uri = URI.parse("http://127.0.0.1:3000/api/datasources")
    body = {"name" => "influxdb graphite","type" =>"influxdb","url" => "http://localhost:8086","access" => "proxy","isDefault" => true,"database" => "graphite","user" => "graphite","password" => "graphite"}

    http = Net::HTTP.new(uri.host, uri.port)

    request = Net::HTTP::Post.new('/api/datasources')
    request.basic_auth("admin","admin")
    request.add_field('Content-Type', 'application/json')
    request.set_form_data(body)
    response = http.request(request)
  end
end

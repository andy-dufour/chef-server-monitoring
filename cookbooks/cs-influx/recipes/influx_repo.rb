#
# Cookbook Name:: tick-stack
# Recipe:: influx_repo
#
# Copyright (c) 2016 Andrew DuFour, Apache v2.
#
# Installs the appropriate tick stack repo for your OS.


if platform_family? 'rhel'
  yum_repository 'influxdb' do
    description 'InfluxDB Repository - RHEL \$releasever'
    baseurl node['tick-stack']['upstream_repository']
    gpgkey 'https://repos.influxdata.com/influxdb.key'
  end
else
  package 'apt-transport-https'

  apt_repository 'influxdb' do
    uri node['tick-stack']['upstream_repository']
    distribution node['lsb']['codename']
    components ['stable']
    arch 'amd64'
    key 'https://repos.influxdata.com/influxdb.key'
  end
end

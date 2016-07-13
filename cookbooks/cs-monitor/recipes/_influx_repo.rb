
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

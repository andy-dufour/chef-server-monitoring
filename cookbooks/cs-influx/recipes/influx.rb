
include_recipe 'cs-influx::influx_repo'

package 'influxdb'

template '/etc/influxdb/influxdb.conf' do
  source 'influxdb.conf.erb'
  notifies :restart, 'service[influxdb]', :delayed
end

service 'influxdb' do
  action [:enable, :start]
end

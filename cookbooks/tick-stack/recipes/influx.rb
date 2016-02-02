
include_recipe "tick-stack::influx_repo"

package 'influxdb'

template '/etc/influxdb.conf' do
  source 'influxdb.conf.erb'
end

service 'influxdb' do
  action [ :enable, :start ]
end

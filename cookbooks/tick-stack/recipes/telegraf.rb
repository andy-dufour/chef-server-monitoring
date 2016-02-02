
package 'telegraf'

template '/etc/telegraf/telegraf.conf' do
  source 'telegraf.conf.erb'
end

service 'telegraf' do
  action [ :enable, :start ]
end

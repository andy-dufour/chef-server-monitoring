override['sensu']['version'] = '0.21.0-2'

default['grafana']['install_type'] = 'package'
default['grafana']['ini']['server']['http_port'] = 3003
default['grafana']['webserver_listen'] = '*'
default['grafana']['webserver_hostname'] = '_'

default['cs-monitor']['statsd']['graphite_host'] = "172.28.128.9"
default['cs-monitor']['statsd']['graphite_port'] = 2003

case node['platform_family']
  when 'rhel', 'fedora'
    case node['platform']
    when 'centos'
      default['tick-stack']['upstream_repository'] = "https://repos.influxdata.com/centos/#{node['platform_version'].to_i}/$basearch/stable"
    else
      default['tick-stack']['upstream_repository'] = "https://repos.influxdata.com/rhel/#{node['platform_version'].to_i}/$basearch/stable"
    end
  else
    default['tick-stack']['upstream_repository'] = "https://repos.influxdata.com/#{node['platform']}"
end

default['influxdb']['telegraf']['username'] = 'telegraf'
default['influxdb']['telegraf']['password'] = 'metricsmetricsmetrics'

default['chef-grafana']['dashboard_path'] = '/usr/share/grafana/public/dashboards'
default['chef-grafana']['config']['dashboards.json']['enabled'] = true
default['chef-grafana']['config']['dashboards.json']['path'] = '/usr/share/grafana/public/dashboards'

default['cs-monitor']['apt-repo'] = "https://packages.chef.io/stable-apt"
default['cs-monitor']['sensu']['additional_client_attributes'] = Mash.new

default['cs-monitor']['sensu']['default_handlers'] = ['debug']
default['cs-monitor']['sensu']['metric_handlers'] = ['debug','graphite']


default['cs-monitor']['sensu']['pagerduty_api_key'] = ""

default['cs-monitor']['sensu']['graphite_address'] = '172.28.128.9'
default['cs-monitor']['sensu']['graphite_port'] = 2003

default['sensu']['init_style'] = "runit"

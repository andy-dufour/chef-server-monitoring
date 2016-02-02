include_recipe 'apache2'
include_recipe 'apache2::mod_wsgi'

cookbook_file '/etc/apache2/sites-available/apache2-graphite.conf' do
  source 'apache2-graphite.conf'
end

packages = %w(graphite-web graphite-carbon)

packages.each do |pkg|
  package pkg
end

apache_site '000-default' do
  enable false
end

directory '/etc/graphite' do
  action :create
end

template '/etc/graphite/local_settings.py' do
  source 'local_settings.py.erb'
end

template '/usr/share/graphite-web/graphite.wsgi' do
  source 'graphite.wsgi.erb'
end

execute 'graphite-manage syncdb' do
  command 'graphite-manage syncdb; touch /tmp/graphite-manage; chown _graphite._graphite /var/lib/graphite/graphite.db'
  not_if { File.exists? ('/tmp/graphite-manage') }
end

file '/etc/default/graphite-carbon' do
  content 'CARBON_CACHE_ENABLED=true'
end

service 'carbon-cache' do
  action [ :enable, :start ]
end

service 'apache2' do
  action [ :enable, :start ]
end

apache_site 'apache2-graphite' do
  enable true
  notifies :reload, 'service[apache2]', :immediately
end

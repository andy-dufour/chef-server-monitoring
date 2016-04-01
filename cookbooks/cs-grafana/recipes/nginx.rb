package "nginx"

file "/etc/nginx/sites-enabled/default" do
  action :delete
end

template "/etc/nginx/sites-enabled/grafana" do
  owner "root"
  group "root"
  mode "0644"
  source "nginx-grafana.conf.erb"
  notifies :restart, "service[nginx]"
end

service 'nginx' do
  action :enable
end

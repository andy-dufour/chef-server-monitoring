directory '/etc/grafana' do
  action :create
end

include_recipe 'cs-grafana::default'

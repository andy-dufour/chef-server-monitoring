include_recipe 'grafana::default'

# grafana_datasource 'influxdb-test' do
#   datasource(
#     type: 'influxdb_09',
#     url: 'http://10.0.0.10:8086',
#     access: 'proxy',
#     database: 'metrics',
#     user: 'dashboard',
#     password: 'dashpass',
#     isdefault: true
#   )
#   action :create
# end

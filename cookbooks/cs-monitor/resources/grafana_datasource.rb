require 'net/http'

resource_name :grafana_datasource

property :name, String, name_property: true
property :type, String, default: 'influxdb'
property :url, String, default: '127.0.0.1'
property :access, String, default: 'proxy'
property :isDefault, String, default: false
property :database, String, default: 'graphite'
property :user, String, default: 'graphite'
property :password, String, default: 'graphite'
property :iface, String, default: 'eth0'

action :create do
  uri = URI.parse("http://#{url}:3000/api/datasources")
  body = { "name" => name,"type" => type,"url" => "http://#{get_influx_server(iface)}:8086","access" => access,"isDefault" => isDefault,"database" => database,"user" => user,"password" => password }
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new('/api/datasources')
  request.basic_auth("admin","admin")
  request.add_field('Content-Type', 'application/json')
  request.set_form_data(body)
  response = http.request(request)
end

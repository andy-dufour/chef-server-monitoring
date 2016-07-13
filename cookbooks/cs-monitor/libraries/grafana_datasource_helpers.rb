def get_influx_server(use_interface)
  influx_server = Chef::Search::Query.new.search(:node, 'name:csm-monitor',
    filter_result: {
      'name' => [ 'name' ],
      'fqdn' => [ 'fqdn' ],
      'network_interfaces' => [ 'network', 'interfaces' ]
    }).first.first #not if no interface data
    Chef::Log.fatal influx_server
    if influx_server.nil?
      return '127.0.0.1'
    else
      return influx_server['network_interfaces'][use_interface]['addresses'].select { |k,v| v['family'] == 'inet' }.keys
    end
end


sensu_gem "sensu-plugin" do
  version node["cs-monitor"]['sensu']["sensu_plugin_version"]
end

handlers = node["cs-monitor"]['sensu']["default_handlers"] + node["cs-monitor"]['sensu']["metric_handlers"]
handlers.each do |handler_name|
  next if handler_name == "debug"
  include_recipe "cs-monitor::_sensu_#{handler_name}_handler"
end

sensu_handler 'default' do
  type 'set'
  handlers node['cs-monitor']['sensu']['default_handlers']
end

sensu_handler 'metrics' do
  type 'set'
  handlers node['cs-monitor']['sensu']['metric_handlers']
end

check_definitions = case
when Chef::DataBag.list.has_key?("sensu_checks")
  search(:sensu_checks, "*:*")
else
  Array.new
end

check_definitions.each do |check|
  sensu_check check["id"] do
    type check["type"]
    command check["command"]
    subscribers check["subscribers"]
    interval check["interval"]
    handlers check["handlers"]
    additional check["additional"]
  end
end

include_recipe "sensu::server_service"

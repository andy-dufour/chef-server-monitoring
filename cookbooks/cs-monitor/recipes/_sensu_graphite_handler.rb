
sensu_handler "graphite" do
  type "tcp"
  socket(
    :host => node['cs-monitor']['sensu']['graphite_address'],
    :port => node['cs-monitor']['sensu']['graphite_port']
  )
  mutator "only_check_output"
end

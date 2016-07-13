def get_node_runlist(vmname)
  case vmname
  when 'monitor'
    machine_runlist = 'cs-monitor::monitor'
  when 'vis'
    machine_runlist = 'cs-monitor::grafana'
  when 'splunk'
    machine_runlist = 'cs-monitor::splunk'
  when 'chef-server'
    machine_runlist = 'cs-monitor::chef-server'
  else
    raise "I don't know what to do with #{vmname}"
  end
  machine_runlist
end

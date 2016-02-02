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

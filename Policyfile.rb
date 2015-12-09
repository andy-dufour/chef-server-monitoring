# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://github.com/opscode/chef-dk/blob/master/POLICYFILE_README.md

# A name that describes what the system you're building with Chef does.
name "chef-server-monitoring"

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list "chef-server-monitoring::default"

# Specify a custom source for a single cookbook:
cookbook "chef-server-monitoring", path: "cookbooks/chef-server-monitoring"
cookbook "redis", git: "https://github.com/miah/chef-redis.git"
cookbook "sensu", git: "https://github.com/sensu/sensu-chef.git"
cookbook "monitor", git: "https://github.com/portertech/chef-monitor.git"

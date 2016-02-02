# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://github.com/opscode/chef-dk/blob/master/POLICYFILE_README.md

# A name that describes what the system you're building with Chef does.
name "cs-monitor"

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list "cs-monitor::default"

# Specify a custom source for a single cookbook:
cookbook "cs-monitor", path: "cookbooks/cs-monitor"
cookbook "redis", git: "https://github.com/miah/chef-redis.git"
cookbook "sensu", git: "https://github.com/sensu/sensu-chef.git"
cookbook "monitor", path: "cookbooks/chef-monitor"
cookbook "tick-stack", path: "cookbooks/tick-stack"

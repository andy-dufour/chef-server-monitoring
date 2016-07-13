current_dir       = ::File.dirname(__FILE__)
parent_dir        = ::File.expand_path(::File.join(current_dir, '..'))
chef_repo_path    parent_dir
cookbook_path     ::File.join(parent_dir, 'vendor')
node_name         'cluster-provisioner'

task :default => [:up]

desc 'Bring up the monitoring cluster (default)'
task :up => :setup do
  sh('chef-client -z -o chef-server-monitoring::provision')
end

desc 'Destroy the monitoring cluster'
task :destroy do
  sh('chef-client -z -o chef-server-monitoring::destroy')
end
task :cleanup => :destroy

desc 'Chef setup tasks'
task :setup do
  if Dir.exist?('vendor')
    sh('berks update --quiet')
    sh('rm -rf vendor/*')
  else
    sh('berks install --quiet')
    Dir.mkdir('vendor')
  end
  sh('berks vendor vendor/ --quiet')
end

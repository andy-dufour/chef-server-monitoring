current_dir       = ::File.dirname(__FILE__)

ssl_verify_mode :verify_none
client_key ::File.join(current_dir, 'client.pem')
local_mode true
chef_zero.enabled true
chef_server_url 'http://localhost:8889'

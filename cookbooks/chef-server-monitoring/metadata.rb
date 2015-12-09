name 'chef-server-monitoring'
maintainer 'Andrew DuFour'
maintainer_email 'you@example.com'
license 'Apache v2'
description 'Installs/Configures chef-server-monitoring'
long_description 'Installs/Configures chef-server-monitoring'
version '0.1.0'

depends 'sensu'
depends 'monitor'

depends 'apt', '= 2.1.1'
depends 'rabbitmq', '= 2.3.0'

require 'infrataster/rspec'

#require 'serverspec'
#require 'net/ssh'

#set :backend, :ssh

# Disable sudo
# set :disable_sudo, true

# Set environment variables
# set :env, :LANG => 'C', :LC_MESSAGES => 'C'

# Set PATH
# set :path, '/sbin:/usr/local/sbin:$PATH'

Infrataster::Server.define(
  :graphite_grafana,
  '127.0.0.1',
  vagrant: true
)

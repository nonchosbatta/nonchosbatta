role :app, %w{deployer@xxx.xxx.xxx.xxx}
role :web, %w{deployer@xxx.xxx.xxx.xxx}
role :db,  %w{deployer@xxx.xxx.xxx.xxx}

server 'xxx.xxx.xxx.xxx', user: 'deployer', roles: %w{web app}

set :branch, :staging
set :rails_env, :staging
fetch(:default_env).merge!(rails_env: :staging)

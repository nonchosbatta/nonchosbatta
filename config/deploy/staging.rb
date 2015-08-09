role :app, %w{deployer@omnibox.omnivium.it}
role :web, %w{deployer@omnibox.omnivium.it}
role :db,  %w{deployer@omnibox.omnivium.it}

server 'omnibox.omnivium.it', user: 'deployer', roles: %w{web app}

set :branch, :staging
set :rails_env, :staging
fetch(:default_env).merge!(rails_env: :staging)

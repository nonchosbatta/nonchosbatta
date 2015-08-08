lock '3.4.0'

set :repo_url, 'git@github.com:RoxasShadow/svogliato.git'
set :application, 'svogliato'
set :user, 'deployer'

set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :scm, :git

set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }

set :format, :pretty
set :log_level, :debug
set :pty, true

# will be overwritten by deploy/*.rb
set :branch, :master
set :rails_env, :production

set :bundle_binstubs, nil

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{log tmp public/system public/assets public/uploads public/system node_modules}

SSHKit.config.command_map[:rake]  = 'bundle exec rake'
SSHKit.config.command_map[:rails] = 'bundle exec rails'

set :keep_releases, 5

set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"
set :puma_preload_app, true
set :puma_init_active_record, true
set :puma_threads, [0, 2]
set :puma_workers, 0

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  namespace :assets do
    Rake::Task['deploy:assets:precompile'].clear_actions

    Rake::Task['deploy:assets:backup_manifest'].clear_actions

    desc 'Precompile assets locally and upload to servers'
    task :precompile do
      on roles(:app) do
        execute :mkdir, "-p #{release_path}/assets_manifest_backup"
      end

      run_locally do
        execute 'npm install'
        execute 'bin/rake assets:precompile'
        roles(:app).each do |server|
          execute :rsync, "-av ./public/assets/ deployer@#{server}:#{release_path}/public/assets/"
        end
        execute :rm, "-rf public/assets/*.*"
      end
    end
  end

  desc 'Install node modules'
  task :npm_install do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        execute :npm, 'install'
      end
    end
  end

  # after :finishing, :restart
  before :compile_assets, :npm_install
  after :finishing, :cleanup
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma

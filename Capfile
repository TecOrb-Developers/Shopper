set :application,           'example-store'
set :repository,            'git://github.com/tryshoppe/example-store.git'
set :scm,                   'git'
set :branch,                'master'
set :deploy_via,            :remote_cache
set :git_enable_submodules, 1
set :ssh_options,           {:forward_agent => true}
set :rails_env,             "production"
set :use_sudo,              false
set :deploy_to,             "/opt/rubyapps/shoppe-example"
set :user,                  'rubyapps'
set :assets_role,           [:app]
set :config_files,          ['database.yml', 'session_token.yml']

load 'deploy'
load 'deploy/assets'
require "bundler/capistrano"

before 'deploy:finalize_update', 'deploy:symlink_config'

role :db,   "demo.tryshoppe.com", :primary => true
role :app,  "demo.tryshoppe.com"

namespace :deploy do
  desc 'Symlink configuration files into new application'
  task :symlink_config, :roles => [:app, :web] do
    commands = fetch(:config_files, []).map do |file|
      "ln -s #{shared_path}/config/#{file} #{release_path}/config/#{file}"
    end.join(' && ')
    run commands
  end
  
  task :start, :roles => :app  do
  end

  task :stop, :roles => :app  do
  end

  task :restart, :roles => :app do
    run "mkdir -p #{current_path}/tmp && touch #{current_path}/tmp/restart.txt"
  end
  
  task :reset, :roles => :db do
    run "cd #{current_path} && RAILS_ENV=#{fetch(:rails_env)} bundle exec rake db:reset shoppe:setup shoppe:seed"
  end
end


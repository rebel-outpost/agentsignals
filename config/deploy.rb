set :default_stage, 'production'
set :stages, %w(production staging development)
require 'capistrano/ext/multistage'
require 'bundler/capistrano'

set :application, "simplecrm"
set :repository,  "git@github.com:rebel-outpost/simplecrm.git"
set :deploy_to, '/var/www/simplecrm/'
set :scm, :git
set :branch, 'master'
set :user, 'deploy'
set :deploy_via, :copy
set :keep_releases, 2
set :use_sudo, false
set :ssh_options, {:forward_agent => true}
set :rails_env, "production"

namespace :deploy do
  desc "symlink shared files"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy:update_code", "deploy:symlink_shared"
after "deploy:update_code", "deploy:migrations"
before "deploy:assets:precompile", "deploy:symlink_shared"

# Unicorn tasks
require 'capistrano-unicorn'
after "deploy:restart", "deploy:cleanup"
after 'deploy:restart', 'unicorn:restart'
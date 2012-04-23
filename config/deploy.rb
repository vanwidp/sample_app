require 'bundler/capistrano'

default_run_options[:pty] = false
ssh_options[:forward_agent] = true
set :use_sudo, false
set :user, "dvw53184"

set :application, "rails.dougvanwie.com"
set :repository,  "git@github.com:vanwidp/sample_app.git"
set :scm, :git
set :branch, 	  "master"
set :git_shallow_clone, 1
set :deploy_via,  :remote_cache
set :copy_compression, :bz2
set :rails_env,   "production"
set :deploy_to, "/#{application}"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "#{application}"
role :web, "#{application}"
role :db,  "#{application}", :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
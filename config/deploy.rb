require 'bundler/capistrano'
require 'rvm/capistrano'
require 'puma/capistrano'
load "deploy/assets"


set :application, 'progress'
default_run_options[:pty] = true
set :user, 'remotedeploy'
set :repository, "git@github.com:fneves/progressdemo.git"
set :domain, '10.160.7.86'
set :use_sudo, false

set :scm, 'git'
set :scm_verbose, true
#set :git_account, "fneves"
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true

set :deploy_via, :export
set :deploy_to, "/home/remotedeploy/apps/progress"

# Target ruby version
set :rvm_ruby_string, '2.0.0'
 
# System-wide RVM installation
set :rvm_type, :user
 
# We use sudo (root) for system-wide RVM installation
set :rvm_install_with_sudo, false


server domain, :app, :web

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                         # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run


set :app_server, :puma
set :stage, :production

#after 'deploy:restart', 'unicorn:reload'
#after 'deploy:restart', 'unicorn:restart'

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

require 'bundler/capistrano'

set :application, "ptconf"
default_environment["RAILS_RELATIVE_URL_ROOT"] = "/ptconf"

# Configure Git Repo
set :scm, :git
set :repository,  "git://github.com/rhavourd/ptconf.git"
ssh_options[:forward_agent] = true
set :branch, "master"
set :deploy_via, :remote_cache


# Configure deployment server
set :user, "passenger"
set :use_sudo, false
set :deploy_to, "/var/www/rails/#{application}"
role :web, "rubysrv.schools-open.com"                         # Your HTTP server, Apache/etc
role :app, "rubysrv.schools-open.com"                         # This may be the same as your `Web` server
role :db,  "rubysrv.schools-open.com", :primary => true       # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    # If you want to make sure your assets have been compiled


    # Trigger a Passenger reload of your app
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :info do
    run "echo RRUR=${RAILS_RELATIVE_URL_ROOT}"
  end
end

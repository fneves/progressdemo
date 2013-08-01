rails_env = ENV['RAILS_ENV'] || 'development'

threads 4,4

bind  "unix:///home/remotedeploy/apps/progress/shared/tmp/puma/progress-puma.sock"
pidfile "/home/remodeploy/apps/progress/current/tmp/puma/pid"
state_path "/home/remotedeploy/apps/progress/current/tmp/puma/state"

activate_control_app

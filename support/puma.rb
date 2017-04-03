#!/usr/bin/env puma

directory   '/rails'
rackup      "/rails/config.ru"
environment 'production'
pidfile     "/tmp/puma.pid"
state_path  "/tmp/puma.state"
threads     0,16
workers     0
bind        'tcp://0.0.0.0:80'

preload_app!

on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/rails/Gemfile"
end

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
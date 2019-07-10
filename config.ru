# This file is used by Rack-based servers to start the application.
require 'sidekiq'
require_relative 'config/environment'
Sidekiq.configure_client do |config|
  config.redis = { size: 1 }
end

run Rails.application

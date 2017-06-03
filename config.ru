# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

# This isn't good for production
# ActionCable.server.config.disable_request_forgery_protection = true

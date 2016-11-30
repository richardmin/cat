# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

config.cache_store = :dalli_store
config.action_controller.perform_caching = true


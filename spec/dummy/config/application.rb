# frozen_string_literal: true

require_relative 'boot'

require 'active_record/railtie'
require 'action_controller/railtie'

puts Bundler
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true
  end
end

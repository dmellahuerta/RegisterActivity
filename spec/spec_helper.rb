# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../dummy/config/environment', __FILE__)
require 'rspec/rails'
require 'byebug'
require 'simplecov'
SimpleCov.start 'rails'
ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join('../support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.fixture_path = Rails.root.join('../fixtures')

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.order = 'random'
end

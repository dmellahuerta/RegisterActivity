# frozen_string_literal: true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../../gemfiles/Gemfile-test', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

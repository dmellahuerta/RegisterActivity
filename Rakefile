# frozen_string_literal: true
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |task, args|
  task.rspec_opts = '-fd'
end

# If you want to make this the default task

task default: [:spec]

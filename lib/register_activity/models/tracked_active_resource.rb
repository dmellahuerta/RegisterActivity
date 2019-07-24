# frozen_string_literal: true

require_relative 'common.rb'
require_relative 'relations/active_resource.rb'
require_relative 'callbacks/save.rb'

module RegisterActivity
  module TrackedActiveResource
    extend ActiveSupport::Concern

    include RegisterActivity::Common
    include RegisterActivity::Relations::ActiveResource
    include RegisterActivity::Save
  end
end

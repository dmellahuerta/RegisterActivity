# frozen_string_literal: true

require_relative 'common.rb'
require_relative 'relations/active_record.rb'
require_relative 'callbacks/update.rb'
require_relative 'callbacks/save.rb'

module RegisterActivity
  module TrackedActiveRecord
    extend ActiveSupport::Concern

    include RegisterActivity::Common
    include RegisterActivity::Relations::ActiveRecord
    include RegisterActivity::Update
    include RegisterActivity::Save
  end
end

# frozen_string_literal: true

require 'active_support/concern'

require 'register_activity/models/action.rb'

module RegisterActivity
  extend ActiveSupport::Concern
  extend ActiveSupport::Autoload

  autoload :Action, 'register_activity/models/action.rb'
  autoload :Tracked, 'register_activity/tracked.rb'

  require 'register_activity/config.rb'
end

require 'register_activity/store_data_controller.rb'

require 'active_support/concern'

module RegisterActivity
  extend ActiveSupport::Concern
  extend ActiveSupport::Autoload

  autoload :Tracked, 'register_activity/tracked.rb'

  require 'register_activity/config.rb'
end
require 'register_activity/store_data_controller.rb'

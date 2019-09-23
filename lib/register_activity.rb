# frozen_string_literal: true

require 'active_support/concern'

module RegisterActivity
  extend ActiveSupport::Concern
  extend ActiveSupport::Autoload

  autoload :RegisterAction, 'register_activity/models/register_action.rb'
  autoload :Common, 'register_activity/models/common.rb'
  autoload :TrackedActiveRecord,
           'register_activity/models/tracked_active_record.rb'
  autoload :TrackedActiveResource,
           'register_activity/models/tracked_active_resource.rb'

  autoload :StoreDataController,
           'register_activity/controllers/store_data_controller.rb'

  require 'register_activity/config.rb'
end

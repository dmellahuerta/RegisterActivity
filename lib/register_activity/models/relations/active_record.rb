module RegisterActivity
  module Relations
    module ActiveRecord
      extend ActiveSupport::Concern

      included do
        has_many :actions, class_name: '::RegisterActivity::RegisterAction',
                           as: :trackable
      end
    end
  end
end

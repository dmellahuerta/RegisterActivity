module RegisterActivity
  module Relations
    module ActiveRecord
      extend ActiveSupport::Concern

      included do
        has_many :actions, class_name: '::RegisterActivity::Action',
                           as: :trackable
      end
    end
  end
end

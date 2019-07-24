module RegisterActivity
  module Create
    extend ActiveSupport::Concern

    included do
      after_create :create_register_activity
    end

    def create_register_activity
      create_action
    end
  end
end

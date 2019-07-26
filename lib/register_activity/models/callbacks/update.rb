module RegisterActivity
  module Update
    extend ActiveSupport::Concern

    included do
      after_save :update_register_activity
    end

    def update_register_activity
      register_action
    end
  end
end

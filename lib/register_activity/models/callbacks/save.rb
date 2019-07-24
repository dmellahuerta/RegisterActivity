module RegisterActivity
  module Save
    extend ActiveSupport::Concern

    included do
      after_save :save_register_activity
    end

    def save_register_activity
      register_action
    end
  end
end

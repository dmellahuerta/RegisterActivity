module RegisterActivity
  module Save
    extend ActiveSupport::Concern

    included do
      after_save :save_register_activity
    end

    def save_register_activity
      save_action(:save)
    end
  end
end

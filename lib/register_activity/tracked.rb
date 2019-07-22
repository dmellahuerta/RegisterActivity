module RegisterActivity
  module Tracked
    extend ActiveSupport::Concern

    included do
      after_save :create_save_activity
    end

    def create_save_activity
    end
  end
end

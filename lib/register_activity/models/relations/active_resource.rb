module RegisterActivity
  module Relations
    module ActiveResource
      extend ActiveSupport::Concern

      def actions
        Action.where(trackable_type: self.class.to_s, trackable_id: id)
      end
    end
  end
end

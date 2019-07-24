# frozen_string_literal: true

module RegisterActivity
  module Common
    extend ActiveSupport::Concern

    included do
      class_attribute  :register_activity_params,
                       :register_activity_trackable,
                       :register_activity_owner,
                       :register_activity_recipient,
                       :register_activity_key,
                       :register_activity_instance
    end

    def register_action
      return if changes.blank?

      self.class.init_action(self)
    end

    class_methods do
      def init_action(instance)
        default_attributes
        self.register_activity_trackable = instance
        assign_attributes
        create_action
      end

      def assign_attributes
        assign_owner
        assign_recipient
        assign_key
        assign_params
      end

      def assign_key
        key = "#{RegisterActivity.controller_name}.#{::RegisterActivity.action_name}"
        self.register_activity_key = key
      end

      def assign_params
        self.register_activity_params = register_activity_trackable.changes
      end

      def assign_owner
        self.register_activity_owner = ::RegisterActivity.owner
      end

      def assign_recipient
        self.register_activity_recipient = nil
      end

      def default_attributes
        self.register_activity_trackable = nil
        self.register_activity_owner = nil
        self.register_activity_recipient = nil
        self.register_activity_key = ''
        self.register_activity_params = {}
      end

      def action_params
        {
          owner: register_activity_owner,
          trackable: register_activity_trackable,
          recipient: register_activity_recipient,
          key: register_activity_key,
          parameters: register_activity_params
        }
      end

      def create_action
        action = Action.new(action_params)
        action.save
      end
    end
  end
end

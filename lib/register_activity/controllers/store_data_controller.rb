module RegisterActivity
  class << self
    def owner=(owner)
      Thread.current[:owner] = owner
    end

    def owner
      Thread.current[:owner]
    end

    def action_name=(action_name)
      Thread.current[:action_name] = action_name
    end

    def action_name
      Thread.current[:action_name]
    end

    def controller_name=(controller_name)
      Thread.current[:controller_name] = controller_name
    end

    def controller_name
      Thread.current[:controller_name]
    end

    def clear_data
      Thread.current[:owner] = nil
      Thread.current[:controller_name] = nil
      Thread.current[:action_name] = nil
    end
  end

  module StoreDataController
    extend ActiveSupport::Concern

    included do
      around_action :store if     respond_to?(:around_action)
      around_filter :store unless respond_to?(:around_action)
    end

    def store
      RegisterActivity.owner = send(RegisterActivity.owner_method)
      RegisterActivity.action_name = action_name
      RegisterActivity.controller_name = controller_name
      yield
    ensure
      RegisterActivity.clear_data
    end
  end
end

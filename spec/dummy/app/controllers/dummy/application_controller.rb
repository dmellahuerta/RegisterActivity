# frozen_string_literal: true

module Dummy
  class ApplicationController < ActionController::Base
    include RegisterActivity::StoreDataController
    protect_from_forgery with: :exception

    def current_user
      Administrator.first
    end
  end
end

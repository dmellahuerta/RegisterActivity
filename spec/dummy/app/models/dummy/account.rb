# frozen_string_literal: true

module Dummy
  class Account < ActiveRecord::Base
    has_many :users
  end
end

# frozen_string_literal: true

module Dummy
  class User < ApplicationRecord
    belongs_to :account
  end
end

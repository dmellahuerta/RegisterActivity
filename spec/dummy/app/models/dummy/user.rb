# frozen_string_literal: true

module Dummy
  class User < ActiveRecord::Base
    include RegisterActivity::TrackedActiveRecord

    belongs_to :account
  end
end

# frozen_string_literal: true

module Dummy
  class ApplicationRecord < ActiveRecord::Base
    include RegisterActivity::TrackedActiveRecord
    self.abstract_class = true
  end
end

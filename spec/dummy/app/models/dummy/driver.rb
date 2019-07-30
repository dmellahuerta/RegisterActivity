# frozen_string_literal: true

module Dummy
  class Driver < ActiveResource::Base
    include RegisterActivity::TrackedActiveResource

    self.site = 'http://someapi.com'
    self.patch_updates = true

    belongs_to :account
  end
end

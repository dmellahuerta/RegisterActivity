# frozen_string_literal: true

RegisterActivity.configure do |config|
  config.owner_method = 'current_user'
end

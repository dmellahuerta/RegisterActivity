# frozen_string_literal: true

RegisterActivity.configure do |config|
  config.owner_method = 'current_user'
  config.recipient_class = Dummy::Account
  config.recipient_attr = 'account_id'
end

# frozen_string_literal: true

RSpec.shared_examples 'user data example' do
  let(:account) { Dummy::Account.create(name: SecureRandom.uuid) }
  let!(:users) do
    5.times.each_with_object([]) do |_, arr|
      arr << Dummy::User.create(name: SecureRandom.uuid, account: account)
    end
  end
  let(:user) { users.first }
end

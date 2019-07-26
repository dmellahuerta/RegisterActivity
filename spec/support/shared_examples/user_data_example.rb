# frozen_string_literal: true

RSpec.shared_examples 'user data example' do
  let!(:users) do
    10.times.each_with_object([]) do |_, arr|
      arr << Dummy::User.create(name: SecureRandom.uuid)
    end
  end
  puts 'include user data example'
end

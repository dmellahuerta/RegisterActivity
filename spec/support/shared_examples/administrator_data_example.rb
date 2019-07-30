# frozen_string_literal: true

RSpec.shared_examples 'administrator data example' do
  let!(:current_administrator) do
    Dummy::Administrator.create(email: 'misterii@test.com')
  end
end

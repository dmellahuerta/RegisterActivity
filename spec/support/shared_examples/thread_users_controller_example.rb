# frozen_string_literal: true

RSpec.shared_examples 'thread users controller' do
  before(:each) do
    allow(RegisterActivity).to receive(:owner).and_return(Dummy::Administrator.first)
    allow(RegisterActivity).to receive(:action_name).and_return('update')
    allow(RegisterActivity).to receive(:controller_name).and_return('users')
  end
end

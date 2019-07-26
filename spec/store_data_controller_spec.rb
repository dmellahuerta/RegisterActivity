# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Dummy::UsersController, type: :controller do
  let!(:current_administrator) do
    Dummy::Administrator.create(email: 'misterii@test.com')
  end

  include_examples 'user data example'

  describe 'action update' do
    context 'success' do
      before :each do
        put :update, params: { id: users.first.id, user: { name: 'misterii' } }
      end

      it 'action attributes trackable' do
        action = Action.last
        expect(action.trackable_type).to eq('Dummy::User')
        expect(action.trackable_id).to eq(users.first.id)
      end

      it 'action attributes owner' do
        action = Action.last
        expect(action.owner_type).to eq('Dummy::Administrator')
        expect(action.owner_id).to eq(current_administrator.id)
      end

      it 'action attributes recipient' do
        action = Action.last
        expect(action.recipient_type).to be_nil
        expect(action.recipient_id).to be_nil
      end
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Dummy::UsersController, type: :controller do
  include_examples 'administrator data example'
  include_examples 'user data example'

  describe 'update' do
    context 'success' do
      before(:each) do
        put :update, params: { id: user.id, user: { name: 'misterii' } }
        @action = RegisterAction.last
      end
      context 'action attributes' do
        it 'trackable' do
          expect(@action.trackable_type).to eq('Dummy::User')
          expect(@action.trackable_id).to eq(users.first.id)
        end

        it 'owner' do
          expect(@action.owner_type).to eq('Dummy::Administrator')
          expect(@action.owner_id).to eq(current_administrator.id)
        end

        it 'recipient' do
          expect(@action.recipient_type).to eq('Dummy::Account')
          expect(@action.recipient_id).to eq(account.id)
        end

        it 'parameters' do
          expect(@action.parameters['name']).to eq(
            [users.first.name, 'misterii']
          )
        end

        it 'key' do
          expect(@action.key).to eq('users.update')
        end
      end

      context 'action relation' do
        it 'owner' do
          owner = RegisterAction.last.owner
          expect(owner.id).to eq(current_administrator.id)
          expect(owner.class).to eq(current_administrator.class)
        end
        it 'trackable' do
          trackable = RegisterAction.last.trackable
          expect(trackable.id).to eq(users.first.id)
          expect(trackable.class).to eq(users.first.class)
        end
        it 'recipient' do
          recipient = RegisterAction.last.recipient
          expect(recipient.id).to eq(account.id)
          expect(recipient.class).to eq(account.class)
        end
      end

      context 'users relation' do
        it 'actions' do
          actions = users.first.actions
          expect(actions.count).to eq(1)
        end
      end
    end
  end
end

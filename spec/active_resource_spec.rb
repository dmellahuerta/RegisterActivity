# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Dummy::DriversController, type: :controller do
  include_examples 'administrator data example'
  include_examples 'drivers data example'

  describe 'update' do
    context 'success' do
      before do
        put :update, params: { id: driver[:id], driver: { name: 'ignotum' } }
        @action = Action.last
      end

      context 'action attributes' do
        it 'trackable' do
          expect(@action.trackable_type).to eq('Dummy::Driver')
          expect(@action.trackable_id).to eq(driver[:id])
        end

        it 'owner' do
          expect(@action.owner_type).to eq('Dummy::Administrator')
          expect(@action.owner_id).to eq(current_administrator.id)
        end

        it 'recipient' do
#          expect(@action.recipient_type).to eq('Dummy::Account')
#          expect(@action.recipient_id).to eq(account.id)
        end

        it 'parameters' do
          expect(@action.parameters['name']).to eq(
            [driver[:name], 'ignotum']
          )
        end

        it 'key' do
          expect(@action.key).to eq('drivers.update')
        end
      end

      context 'action relation' do
        it 'owner' do
          owner = Action.last.owner
          expect(owner.id).to eq(current_administrator.id)
          expect(owner.class).to eq(current_administrator.class)
        end
        it 'trackable' do
          trackable = Action.last.trackable
          expect(trackable.id).to eq(driver[:id])
          expect(trackable.class).to eq(Dummy::Driver)
        end
        it 'recipient' do
          #recipient = Action.last.recipient
          #expect(recipient.id).to eq(account.id)
          #expect(recipient.class).to eq(account.class)
        end
      end

      context 'drivers relation' do
        it 'actions' do
          actions = Dummy::Driver.find(driver[:id]).actions

          expect(actions.count).to eq(1)
        end
      end
    end
  end
end

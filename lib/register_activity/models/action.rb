# frozen_string_literal: true

module RegisterActivity
  class Action < ActiveRecord::Base
    belongs_to :trackable, polymorphic: true
    belongs_to :owner, polymorphic: true
    belongs_to :recipient, polymorphic: true, optional: true

    validates :trackable, presence: true
    validates :owner, presence: true
    validates :key, presence: true
    validates :parameters, presence: true

    def trackable
      find_relation(trackable_id, trackable_type)
    end

    def owner
      find_relation(owner_id, owner_type)
    end

    def recipient
      find_relation(recipient_id, recipient_type)
    end

    def trackable=(obj)
      set_relation('trackable', obj)
    end

    def owner=(obj)
      set_relation('owner', obj)
    end

    def recipient=(obj)
      set_relation('recipient', obj)
    end

    private

    def find_relation(relation_id, relation_type)
      return nil unless relation_id && relation_type

      relation_type.constantize.find(relation_id)
    end

    def set_relation(belong, obj)
      send(belong + '_id=', obj.id)
      send(belong + '_type=', obj.class.name)
    end
  end
end

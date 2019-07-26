# frozen_string_literal: true

class Setup < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :account_id
      t.timestamps
    end

    create_table :administrators do |t|
      t.string :email
      t.timestamps
    end

    create_table :actions do |t|
      t.string :trackable_type, null: false
      t.integer :trackable_id,  null: false, limit: 8
      t.string :owner_type,     null: false
      t.bigint :owner_id,       null: false, limit: 8
      t.string :key,            null: false
      t.text :parameters,       null: false
      t.string :recipient_type
      t.bigint :recipient_id
    end

    create_table :accounts do |t|
      t.string :name
      t.timestamps
    end
  end
end

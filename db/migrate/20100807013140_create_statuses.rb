# frozen_string_literal: true

class CreateStatuses < ActiveRecord::Migration[4.2]
  def self.up
    create_table :statuses do |t|
      t.string :name
      t.integer :amount
      t.timestamps
    end
  end

  def self.down
    drop_table :statuses
  end
end

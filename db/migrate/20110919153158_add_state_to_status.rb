# frozen_string_literal: true

class AddStateToStatus < ActiveRecord::Migration[4.2]
  def self.up
    add_column :statuses, :state, :integer
  end

  def self.down
    remove_column :statuses, :state
  end
end

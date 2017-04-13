# frozen_string_literal: true

class AddStateToStatus < ActiveRecord::Migration
  def self.up
    add_column :statuses, :state, :integer
  end

  def self.down
    remove_column :statuses, :state
  end
end

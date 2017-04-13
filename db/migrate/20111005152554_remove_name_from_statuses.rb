# frozen_string_literal: true

class RemoveNameFromStatuses < ActiveRecord::Migration
  def self.up
    remove_column :statuses, :name
  end

  def self.down
    add_column :statuses, :name, :string
  end
end

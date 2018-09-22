# frozen_string_literal: true

class RemoveNameFromStatuses < ActiveRecord::Migration[4.2]
  def self.up
    remove_column :statuses, :name
  end

  def self.down
    add_column :statuses, :name, :string
  end
end

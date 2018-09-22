# frozen_string_literal: true

class Available < ActiveRecord::Migration[4.2]
  def self.up
    add_column :statuses, :available, :boolean, default: true
  end

  def self.down
    remove_column :statuses, :available
  end
end

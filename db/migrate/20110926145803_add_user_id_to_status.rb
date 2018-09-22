# frozen_string_literal: true

class AddUserIdToStatus < ActiveRecord::Migration[4.2]
  def self.up
    add_column :statuses, :user_id, :integer
  end

  def self.down
    remove_column :statuses, :user_id
  end
end

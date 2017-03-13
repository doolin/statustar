# frozen_string_literal: true
class RemoveAmountFromStatuses < ActiveRecord::Migration
  def self.up
    remove_column :statuses, :amount
  end

  def self.down
    add_column :statuses, :amount, :integer
  end
end

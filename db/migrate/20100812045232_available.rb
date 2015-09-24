class Available < ActiveRecord::Migration
  def self.up
    add_column :statuses, :available, :boolean, default: true
  end

  def self.down
    remove_column :statuses, :available
  end
end

class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.integer :sid
      t.integer :uid
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :statuses
  end
end

class CreateLogins < ActiveRecord::Migration
  def self.up
    create_table :logins do |t|
      t.number :id
      t.string :user
      t.string :passwd

      t.timestamps
    end
  end

  def self.down
    drop_table :logins
  end
end

class CreateStatustars < ActiveRecord::Migration
  def self.up
    create_table :statustars do |statustar|
        statustar.column "id", :int
      statustar.timestamps
    end
  end

  def self.down
    drop_table :statustars
  end
end

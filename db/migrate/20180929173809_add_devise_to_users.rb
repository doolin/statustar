class AddDeviseToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      # t.change :email,              null: false, default: ""
      t.rename :name, :username
      t.string :password, null: false, default: ""
      t.string :password_confirmation, null: false, default: ""
      # t.string :encrypted_password, null: false, default: ""

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end

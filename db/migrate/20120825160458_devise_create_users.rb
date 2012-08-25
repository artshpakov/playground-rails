class DeviseCreateUsers < ActiveRecord::Migration

  def change
    create_table(:users) do |t|
      t.string :login,              :null => false, :limit => 15
      t.string :email,              :limit => 30
      t.string :encrypted_password
      t.datetime :remember_created_at
      t.timestamp :created_at, :null => false
    end

    add_index :users, :login, :unique => true
    add_index :users, :email, :unique => true
  end

end

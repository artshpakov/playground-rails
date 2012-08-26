ActiveRecord::Schema.define(:version => 20120826085529) do

  create_table "users", :force => true do |t|
    t.string   "login",               :limit => 15, :null => false
    t.string   "email",               :limit => 30
    t.string   "encrypted_password"
    t.datetime "remember_created_at"
    t.datetime "created_at",                        :null => false
    t.string   "provider",            :limit => 10
    t.string   "uid",                 :limit => 20
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end

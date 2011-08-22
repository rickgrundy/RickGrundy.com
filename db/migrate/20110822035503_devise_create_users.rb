class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    drop_table(:users) if ActiveRecord::Base.connection.tables.include?("users")
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.rememberable
      t.timestamps
    end
    
    User.connection.execute "INSERT INTO users (email, encrypted_password, password_salt) VALUES ('rick@rickgrundy.com', '$2a$10$n7E6/2xc25YKt44sikKVOe/iyW4zJinHffPT8aobIHDydL7P7kmYq', '$2a$10$n7E6/2xc25YKt44sikKVOe');"
  end

  def self.down
    drop_table :users
  end
end
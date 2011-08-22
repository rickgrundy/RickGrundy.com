# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110822035503) do

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.text     "blurb"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",     :default => false
  end

  create_table "albums_photos", :id => false, :force => true do |t|
    t.integer "photo_id"
    t.integer "album_id"
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.text     "blurb"
    t.datetime "taken"
    t.string   "aperture"
    t.string   "exposure"
    t.string   "iso"
    t.string   "focal_length"
    t.string   "camera"
    t.string   "folder_path"
    t.string   "url_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :default => "", :null => false
    t.string   "encrypted_password",  :limit => 128, :default => "", :null => false
    t.string   "password_salt",                      :default => "", :null => false
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130224161209) do

  create_table "cas", :force => true do |t|
    t.string   "titol"
    t.text     "descripcio"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contents", :force => true do |t|
    t.text     "text"
    t.text     "mini_text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "documents", :force => true do |t|
    t.string   "titol"
    t.integer  "cas_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.string   "descripcio"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "menu_title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "home"
  end

  create_table "pregunta", :force => true do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "cas_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "resposta", :force => true do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "pregunta_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "salt"
    t.string   "token"
    t.datetime "token_valid_until"
    t.integer  "failed_login_attempts"
    t.datetime "login_blocked_until"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "name"
    t.string   "last_name"
    t.string   "status"
  end

end

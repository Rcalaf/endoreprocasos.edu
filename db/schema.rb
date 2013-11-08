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

ActiveRecord::Schema.define(:version => 20131108173334) do

  create_table "cas", :force => true do |t|
    t.string   "titol"
    t.text     "descripcio"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "year"
    t.boolean  "hidden"
  end

  create_table "consulta", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "mensaje"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contents", :force => true do |t|
    t.text     "text"
    t.text     "embed_code"
    t.text     "big_image_text"
    t.text     "small_image_text"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "page_id"
    t.string   "content_type"
    t.integer  "position"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "cas_id"
    t.text     "image_text"
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
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "home"
    t.string   "slug"
    t.boolean  "public",      :default => false
    t.integer  "position"
    t.string   "description"
  end

  create_table "pregunta", :force => true do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "cas_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "owner_name"
  end

  create_table "resposta", :force => true do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "pregunta_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "owner_name"
  end

  create_table "settings", :force => true do |t|
    t.text     "footer"
    t.string   "main_title"
    t.string   "subtitle"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "footer_logo_file_name"
    t.string   "footer_logo_content_type"
    t.integer  "footer_logo_file_size"
    t.datetime "footer_logo_updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.text     "front_footer"
    t.string   "main_description"
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
    t.string   "thumb_file_name"
    t.string   "thumb_content_type"
    t.integer  "thumb_file_size"
    t.datetime "thumb_updated_at"
    t.string   "hospital"
  end

end

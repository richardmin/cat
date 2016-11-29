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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161128222548) do

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "chat_rooms", ["user_id"], name: "index_chat_rooms_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "body",       limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "team_id",    limit: 4
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "body",         limit: 65535
    t.integer  "user_id",      limit: 4
    t.integer  "chat_room_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "messages", ["chat_room_id"], name: "index_messages_on_chat_room_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "team_configs", force: :cascade do |t|
    t.string   "description", limit: 255
    t.integer  "num_support", limit: 4
    t.integer  "num_tank",    limit: 4
    t.integer  "num_DPS",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "team_config_id", limit: 4
  end

  add_index "teams", ["team_config_id"], name: "index_teams_on_team_config_id", using: :btree

  create_table "user_looking_for_teams", force: :cascade do |t|
    t.string   "role",               limit: 255
    t.datetime "time_queue_started"
    t.integer  "user_id",            limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "user_looking_for_teams", ["user_id"], name: "index_user_looking_for_teams_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "bracket",                limit: 255
    t.string   "battlenetid",            limit: 255
    t.string   "region",                 limit: 255
  end

  add_index "users", ["battlenetid"], name: "index_users_on_battlenetid", unique: true, using: :btree
  add_index "users", ["bracket"], name: "index_users_on_bracket", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "chat_rooms", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "teams", "team_configs"
  add_foreign_key "user_looking_for_teams", "users"
end

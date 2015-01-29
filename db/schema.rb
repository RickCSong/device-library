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

ActiveRecord::Schema.define(version: 20150128093025) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "code",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "categories", ["code"], name: "index_categories_on_code", unique: true, using: :btree
  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "devices", force: :cascade do |t|
    t.string   "hardware",         limit: 255
    t.string   "operating_system", limit: 255
    t.string   "storage_code",     limit: 255,               null: false
    t.string   "barcode",          limit: 255,               null: false
    t.integer  "status",           limit: 4,     default: 0, null: false
    t.text     "details",          limit: 65535
    t.integer  "user_id",          limit: 4
    t.integer  "category_id",      limit: 4,                 null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "devices", ["barcode"], name: "index_devices_on_barcode", unique: true, using: :btree
  add_index "devices", ["category_id"], name: "index_devices_on_category_id", using: :btree
  add_index "devices", ["user_id"], name: "index_devices_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",   limit: 255,             null: false
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.integer  "role",       limit: 4,   default: 0, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "devices", "categories"
  add_foreign_key "devices", "users"
end

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

ActiveRecord::Schema.define(version: 20160302064348) do

  create_table "area_aims", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "area_id",     limit: 4
    t.integer  "state_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "area_aims", ["area_id"], name: "index_area_aims_on_area_id", using: :btree
  add_index "area_aims", ["state_id"], name: "index_area_aims_on_state_id", using: :btree

  create_table "area_groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "area_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "area_groups", ["area_id"], name: "index_area_groups_on_area_id", using: :btree

  create_table "areas", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.text     "creator",     limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "client_activities", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.integer  "client_id",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "client_activities", ["client_id"], name: "index_client_activities_on_client_id", using: :btree

  create_table "client_properties", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.integer  "property_id", limit: 4
    t.integer  "client_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "client_properties", ["client_id"], name: "index_client_properties_on_client_id", using: :btree
  add_index "client_properties", ["property_id"], name: "index_client_properties_on_property_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "identity",       limit: 255
    t.string   "telephone",      limit: 255
    t.string   "address",        limit: 255
    t.integer  "state_id",       limit: 4
    t.integer  "type_client_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "clients", ["state_id"], name: "index_clients_on_state_id", using: :btree
  add_index "clients", ["type_client_id"], name: "index_clients_on_type_client_id", using: :btree

  create_table "kind_properties", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "labor_changes", force: :cascade do |t|
    t.text     "property",   limit: 65535
    t.text     "previus",    limit: 65535
    t.text     "mint",       limit: 65535
    t.integer  "labor_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "labor_changes", ["labor_id"], name: "index_labor_changes_on_labor_id", using: :btree

  create_table "labor_comments", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.integer  "kind",        limit: 4
    t.integer  "labor_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "labor_comments", ["labor_id"], name: "index_labor_comments_on_labor_id", using: :btree

  create_table "labors", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.text     "description",           limit: 65535
    t.integer  "indicator",             limit: 4
    t.text     "indicator_description", limit: 65535
    t.date     "ending"
    t.date     "initiation"
    t.integer  "area_aim_id",           limit: 4
    t.integer  "project_id",            limit: 4
    t.integer  "state_id",              limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "client_id",             limit: 4
  end

  add_index "labors", ["area_aim_id"], name: "index_labors_on_area_aim_id", using: :btree
  add_index "labors", ["client_id"], name: "index_labors_on_client_id", using: :btree
  add_index "labors", ["project_id"], name: "index_labors_on_project_id", using: :btree
  add_index "labors", ["state_id"], name: "index_labors_on_state_id", using: :btree

  create_table "list_properties", force: :cascade do |t|
    t.integer  "property_id",    limit: 4
    t.integer  "type_client_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "list_properties", ["property_id"], name: "index_list_properties_on_property_id", using: :btree
  add_index "list_properties", ["type_client_id"], name: "index_list_properties_on_type_client_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.text     "description",      limit: 65535
    t.integer  "state_id",         limit: 4
    t.integer  "kind_property_id", limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "properties", ["kind_property_id"], name: "index_properties_on_kind_property_id", using: :btree
  add_index "properties", ["state_id"], name: "index_properties_on_state_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "type_clients", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "state_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "type_clients", ["state_id"], name: "index_type_clients_on_state_id", using: :btree

  add_foreign_key "area_aims", "areas"
  add_foreign_key "area_aims", "states"
  add_foreign_key "area_groups", "areas"
  add_foreign_key "client_activities", "clients"
  add_foreign_key "client_properties", "clients"
  add_foreign_key "client_properties", "properties"
  add_foreign_key "clients", "states"
  add_foreign_key "clients", "type_clients"
  add_foreign_key "labor_changes", "labors"
  add_foreign_key "labor_comments", "labors"
  add_foreign_key "labors", "area_aims"
  add_foreign_key "labors", "clients"
  add_foreign_key "labors", "projects"
  add_foreign_key "labors", "states"
  add_foreign_key "list_properties", "properties"
  add_foreign_key "list_properties", "type_clients"
  add_foreign_key "properties", "kind_properties"
  add_foreign_key "properties", "states"
  add_foreign_key "type_clients", "states"
end

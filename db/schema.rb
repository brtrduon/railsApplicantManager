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

ActiveRecord::Schema.define(version: 20180102032921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "job_position"
    t.string   "city"
    t.date     "can_start"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "employees", ["user_id"], name: "index_employees_on_user_id", using: :btree

  create_table "hires", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "job_position"
    t.string   "city"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "hires", ["user_id"], name: "index_hires_on_user_id", using: :btree

  create_table "recycles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "job_position"
    t.string   "city"
    t.date     "can_start"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "recycles", ["user_id"], name: "index_recycles_on_user_id", using: :btree

  create_table "scolds", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recycle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "scolds", ["recycle_id"], name: "index_scolds_on_recycle_id", using: :btree
  add_index "scolds", ["user_id"], name: "index_scolds_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "employees", "users"
  add_foreign_key "hires", "users"
  add_foreign_key "recycles", "users"
  add_foreign_key "scolds", "recycles"
  add_foreign_key "scolds", "users"
end

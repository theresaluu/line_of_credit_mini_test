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

ActiveRecord::Schema.define(version: 20160129050317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "credits", force: :cascade do |t|
    t.float    "apr",        null: false
    t.float    "line_max",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name",       null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.float    "amount"
    t.integer  "day"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "withdrawal", default: true, null: false
    t.integer  "credit_id"
  end

  add_index "transactions", ["credit_id"], name: "index_transactions_on_credit_id", using: :btree

  add_foreign_key "transactions", "credits"
end

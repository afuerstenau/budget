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

ActiveRecord::Schema.define(version: 20170820135230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "expense"
    t.boolean "income"
    t.string "description"
  end

  create_table "plannedtransactions", id: :serial, force: :cascade do |t|
    t.string "name"
    t.decimal "amount", precision: 8, scale: 2
    t.boolean "repeat_yearly"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.boolean "january"
    t.boolean "february"
    t.boolean "march"
    t.boolean "april"
    t.boolean "may"
    t.boolean "june"
    t.boolean "july"
    t.boolean "august"
    t.boolean "september"
    t.boolean "october"
    t.boolean "november"
    t.boolean "december"
    t.index ["category_id"], name: "index_plannedtransactions_on_category_id"
  end

  create_table "transactions", id: :serial, force: :cascade do |t|
    t.integer "moneymoney_id"
    t.date "occurance_date"
    t.date "value_date"
    t.integer "category_id"
    t.string "name"
    t.string "purpose"
    t.string "account"
    t.string "bank"
    t.decimal "amount"
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_transactions_on_category_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "plannedtransactions", "categories"
end
